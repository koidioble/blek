// lib/widgets/activity_monitor.dart
import 'package:flutter/material.dart';
import 'package:koidio_ble/services/supabase_auth_service.dart';

/// Wraps the app to monitor user activity and handle inactivity timeout
class ActivityMonitor extends StatefulWidget {
  final Widget child;
  final VoidCallback? onInactivityLogout;

  const ActivityMonitor({
    super.key,
    required this.child,
    this.onInactivityLogout,
  });

  @override
  State<ActivityMonitor> createState() => _ActivityMonitorState();
}

class _ActivityMonitorState extends State<ActivityMonitor> {
  @override
  void initState() {
    super.initState();

    // Register the inactivity logout callback
    SupabaseAuthService.setInactivityLogoutCallback(() {
      if (mounted) {
        _showInactivityDialog();
      }
    });
  }

  void _showInactivityDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            title: Row(
              children: [
                Icon(Icons.logout, color: Colors.orange),
                SizedBox(width: 12),
                Text('Session Expired'),
              ],
            ),
            content: Text(
              'You have been logged out due to 15 minutes of inactivity. Please sign in again to continue.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (widget.onInactivityLogout != null) {
                    widget.onInactivityLogout!();
                  }
                },
                child: Text('OK'),
              ),
            ],
          ),
    );
  }

  void _handleUserActivity() {
    // Reset the inactivity timer on any user interaction
    if (SupabaseAuthService.isLoggedIn()) {
      SupabaseAuthService.resetInactivityTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleUserActivity,
      onPanDown: (_) => _handleUserActivity(),
      onScaleStart: (_) => _handleUserActivity(),
      behavior: HitTestBehavior.translucent,
      child: Listener(
        onPointerDown: (_) => _handleUserActivity(),
        onPointerMove: (_) => _handleUserActivity(),
        onPointerUp: (_) => _handleUserActivity(),
        child: widget.child,
      ),
    );
  }
}

/// Widget to display remaining session time (optional)
class SessionTimeIndicator extends StatefulWidget {
  const SessionTimeIndicator({super.key});

  @override
  State<SessionTimeIndicator> createState() => _SessionTimeIndicatorState();
}

class _SessionTimeIndicatorState extends State<SessionTimeIndicator> {
  String _timeRemaining = '';

  @override
  void initState() {
    super.initState();
    _updateTimer();
    // Update every 30 seconds
    Future.delayed(Duration.zero, () {
      _scheduleUpdate();
    });
  }

  void _scheduleUpdate() {
    if (!mounted) return;

    Future.delayed(const Duration(seconds: 30), () {
      if (mounted) {
        _updateTimer();
        _scheduleUpdate();
      }
    });
  }

  void _updateTimer() {
    if (!SupabaseAuthService.isLoggedIn()) {
      setState(() => _timeRemaining = '');
      return;
    }

    final remaining = SupabaseAuthService.getRemainingSessionTime();
    if (remaining == null) {
      setState(() => _timeRemaining = '');
      return;
    }

    final minutes = remaining.inMinutes;
    final seconds = remaining.inSeconds % 60;

    setState(() {
      if (minutes <= 0 && seconds <= 0) {
        _timeRemaining = 'Expired';
      } else if (minutes <= 5) {
        // Show warning when less than 5 minutes remain
        _timeRemaining = '${minutes}m ${seconds}s';
      } else {
        _timeRemaining = '${minutes}m';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_timeRemaining.isEmpty || !SupabaseAuthService.isLoggedIn()) {
      return const SizedBox.shrink();
    }

    final remaining = SupabaseAuthService.getRemainingSessionTime();
    final isWarning = remaining != null && remaining.inMinutes <= 5;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color:
            isWarning
                ? Colors.orange.withValues(alpha: 0.2)
                : Colors.blue.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isWarning ? Colors.orange : Colors.blue,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isWarning ? Icons.warning_amber : Icons.timer,
            size: 14,
            color: isWarning ? Colors.orange : Colors.blue,
          ),
          const SizedBox(width: 4),
          Text(
            _timeRemaining,
            style: TextStyle(
              fontSize: 12,
              color: isWarning ? Colors.orange : Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
