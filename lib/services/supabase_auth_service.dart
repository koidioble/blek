// lib/services/supabase_auth_service.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum UserRole { reader, author, admin }

class User {
  final String id;
  final String email;
  final String name;
  final UserRole role;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'] ?? json['display_name'] ?? 'User',
      role: _parseRole(json['role']),
    );
  }

  static UserRole _parseRole(String? role) {
    switch (role?.toLowerCase()) {
      case 'author':
        return UserRole.author;
      case 'admin':
        return UserRole.admin;
      default:
        return UserRole.reader;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'role': role.toString().split('.').last,
    };
  }
}

class SupabaseAuthService {
  static final SupabaseClient _supabase = Supabase.instance.client;
  static User? _currentUser;

  // Inactivity timeout management
  static Timer? _inactivityTimer;
  static DateTime? _lastActivityTime;
  static const Duration _inactivityTimeout = Duration(minutes: 15);
  static VoidCallback? _onInactivityLogout;

  /// Initialize Supabase
  static Future<void> initialize() async {
    try {
      await Supabase.initialize(url: '', anonKey: '');

      // Listen to auth state changes
      _supabase.auth.onAuthStateChange.listen((data) {
        final session = data.session;
        if (session != null) {
          _loadUserData(session.user.id);
          _startInactivityTimer();
        } else {
          _currentUser = null;
          _stopInactivityTimer();
        }
      });

      // Load current user if already logged in
      final session = _supabase.auth.currentSession;
      if (session != null) {
        await _loadUserData(session.user.id);
        _startInactivityTimer();
      }
    } catch (e) {
      print('Supabase initialization error: $e');
      rethrow;
    }
  }

  /// Register callback for inactivity logout
  static void setInactivityLogoutCallback(VoidCallback callback) {
    _onInactivityLogout = callback;
  }

  /// Reset activity timer (call this on user interaction)
  static void resetInactivityTimer() {
    if (!isLoggedIn()) return;

    _lastActivityTime = DateTime.now();

    // Restart the timer
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      _checkInactivity();
    });
  }

  /// Check if user has been inactive for too long
  static void _checkInactivity() {
    if (_lastActivityTime == null) return;

    final now = DateTime.now();
    final inactiveDuration = now.difference(_lastActivityTime!);

    if (inactiveDuration >= _inactivityTimeout) {
      _handleInactivityLogout();
    }
  }

  /// Handle automatic logout due to inactivity
  static Future<void> _handleInactivityLogout() async {
    print('User logged out due to inactivity');
    _stopInactivityTimer();
    await signOut();

    // Notify the app about inactivity logout
    if (_onInactivityLogout != null) {
      _onInactivityLogout!();
    }
  }

  /// Start inactivity timer
  static void _startInactivityTimer() {
    _lastActivityTime = DateTime.now();
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      _checkInactivity();
    });
  }

  /// Stop inactivity timer
  static void _stopInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = null;
    _lastActivityTime = null;
  }

  /// Get remaining time before auto-logout
  static Duration? getRemainingSessionTime() {
    if (_lastActivityTime == null) return null;

    final elapsed = DateTime.now().difference(_lastActivityTime!);
    final remaining = _inactivityTimeout - elapsed;

    return remaining.isNegative ? Duration.zero : remaining;
  }

  /// Load user data from database
  static Future<void> _loadUserData(String userId) async {
    try {
      // Try to get user from database
      final response =
          await _supabase.from('users').select().eq('id', userId).maybeSingle();

      if (response != null) {
        _currentUser = User.fromJson(response);
      } else {
        // Fallback: create user from auth metadata
        final authUser = _supabase.auth.currentUser;
        if (authUser != null) {
          _currentUser = User(
            id: authUser.id,
            email: authUser.email ?? '',
            name: authUser.userMetadata?['name'] ?? 'User',
            role: UserRole.reader,
          );
        }
      }
    } catch (e) {
      print('Error loading user data: $e');
      // Fallback to auth user data
      final authUser = _supabase.auth.currentUser;
      if (authUser != null) {
        _currentUser = User(
          id: authUser.id,
          email: authUser.email ?? '',
          name: authUser.userMetadata?['name'] ?? 'User',
          role: UserRole.reader,
        );
      }
    }
  }

  /// Sign up new user
  static Future<User?> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // 1. Sign up with Supabase Auth
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {'name': name, 'display_name': name},
        emailRedirectTo: null,
      );

      if (response.user == null) {
        throw Exception('Failed to create account');
      }

      final userId = response.user!.id;
      final needsEmailConfirmation = response.user!.emailConfirmedAt == null;

      // 2. Create user profile in database
      try {
        await _supabase.from('users').upsert({
          'id': userId,
          'email': email,
          'name': name,
          'role': 'reader',
          'created_at': DateTime.now().toIso8601String(),
        }, onConflict: 'id');
      } catch (insertError) {
        print('Profile upsert note: $insertError');
      }

      // 3. If email needs confirmation, return null but don't throw error
      if (needsEmailConfirmation) {
        print('Email confirmation required for: $email');
        await _supabase.auth.signOut();
        return null;
      }

      // 4. Email already confirmed, load user data
      await Future.delayed(const Duration(milliseconds: 500));
      await _loadUserData(userId);

      _currentUser ??= User(
        id: userId,
        email: email,
        name: name,
        role: UserRole.reader,
      );

      _startInactivityTimer();
      return _currentUser;
    } on AuthException catch (e) {
      print('Auth exception during sign up: ${e.message}');
      throw Exception(e.message);
    } catch (e) {
      print('Sign up error: $e');
      throw Exception('Failed to create account. Please try again.');
    }
  }

  /// Resend confirmation email
  static Future<void> resendConfirmationEmail(String email) async {
    try {
      await _supabase.auth.resend(type: OtpType.signup, email: email);
    } catch (e) {
      print('Resend confirmation error: $e');
      throw Exception('Failed to resend confirmation email');
    }
  }

  /// Sign in existing user
  static Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        await _loadUserData(response.user!.id);

        // Fallback if user data couldn't be loaded
        _currentUser ??= User(
          id: response.user!.id,
          email: response.user!.email ?? email,
          name: response.user!.userMetadata?['name'] ?? 'User',
          role: UserRole.reader,
        );

        _startInactivityTimer();
        return _currentUser;
      }
      return null;
    } on AuthException catch (e) {
      print('Auth exception during sign in: ${e.message}');
      throw Exception(e.message);
    } catch (e) {
      print('Sign in error: $e');
      throw Exception('Invalid email or password');
    }
  }

  /// Sign out
  static Future<void> signOut() async {
    _stopInactivityTimer();
    await _supabase.auth.signOut();
    _currentUser = null;
  }

  /// Check if user is logged in
  static bool isLoggedIn() {
    return _supabase.auth.currentUser != null;
  }

  /// Get current user
  static User? getCurrentUser() {
    return _currentUser;
  }

  /// ✅ FIXED: Allow ALL logged-in users to create posts
  static bool canCreatePosts() {
    return isLoggedIn(); // Any logged-in user can create posts
  }

  /// Check if user is admin
  static bool isAdmin() {
    if (_currentUser == null) return false;
    return _currentUser!.role == UserRole.admin;
  }

  /// Send password reset email
  static Future<void> resetPassword(String email) async {
    await _supabase.auth.resetPasswordForEmail(email);
  }

  /// Update user profile
  static Future<void> updateProfile({String? name, String? email}) async {
    if (_currentUser == null) return;

    final updates = <String, dynamic>{};
    if (name != null) updates['name'] = name;
    if (email != null) updates['email'] = email;

    if (updates.isNotEmpty) {
      await _supabase.from('users').update(updates).eq('id', _currentUser!.id);
      await _loadUserData(_currentUser!.id);
    }

    resetInactivityTimer();
  }

  /// Update user role (admin only)
  static Future<void> updateUserRole(String userId, UserRole role) async {
    if (!isAdmin()) {
      throw Exception('Only admins can update user roles');
    }

    await _supabase
        .from('users')
        .update({'role': role.toString().split('.').last})
        .eq('id', userId);

    resetInactivityTimer();
  }
}
