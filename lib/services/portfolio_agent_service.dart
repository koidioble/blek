import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class PortfolioAgentService {
  PortfolioAgentService._();

  static final PortfolioAgentService instance = PortfolioAgentService._();

  Map<String, dynamic>? _knowledge;

  Future<void> load() async {
    if (_knowledge != null) return;

    final raw = await rootBundle.loadString(
      'assets/data/portfolio_agent_knowledge.json',
    );

    _knowledge = jsonDecode(raw) as Map<String, dynamic>;
  }

  Future<String> respond(String message) async {
    await load();

    final question = message.toLowerCase();
    final topics = Map<String, dynamic>.from(_knowledge!['topics'] as Map);

    final matches = <String, List<String>>{
      'flutter': ['flutter', 'dart', 'mobile', 'web app'],
      'firebase': ['firebase', 'hosting', 'deploy'],
      'cloud': ['cloud', 'aws', 'cybersecurity', 'security'],
      'career': ['job', 'career', 'role', 'experience', 'work'],
      'contact': ['contact', 'email', 'reach', 'linkedin', 'github'],
      'siikaa': ['siikaa', 'agritech', 'agriculture'],
    };

    for (final entry in matches.entries) {
      if (entry.value.any(question.contains)) {
        return topics[entry.key] as String;
      }
    }

    return _knowledge!['fallback'] as String;
  }

  Future<String> get greeting async {
    await load();
    return _knowledge!['greeting'] as String;
  }
}
