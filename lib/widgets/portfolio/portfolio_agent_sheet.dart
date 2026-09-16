import 'package:flutter/material.dart';

import 'package:koidio_ble/services/portfolio_agent_service.dart';

class PortfolioAgentSheet extends StatefulWidget {
  const PortfolioAgentSheet({super.key});

  @override
  State<PortfolioAgentSheet> createState() => _PortfolioAgentSheetState();
}

class _PortfolioAgentSheetState extends State<PortfolioAgentSheet> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();

  final List<_ChatMessage> _messages = [];
  bool _isLoading = true;
  bool _isResponding = false;
  String? _loadError;

  @override
  void initState() {
    super.initState();
    _startConversation();
  }

  Future<void> _startConversation() async {
    try {
      final greeting = await PortfolioAgentService.instance.greeting;

      if (!mounted) return;

      setState(() {
        _messages.add(_ChatMessage(text: greeting, isUser: false));
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;

      setState(() {
        _loadError =
            'The portfolio guide could not load right now. Please use the '
            'project and contact sections to learn more.';
        _isLoading = false;
      });
    }
  }

  Future<void> _sendMessage([String? quickQuestion]) async {
    final message = (quickQuestion ?? _messageController.text).trim();

    if (message.isEmpty || _isResponding || _isLoading) return;

    _messageController.clear();

    setState(() {
      _messages.add(_ChatMessage(text: message, isUser: true));
      _isResponding = true;
    });

    _scrollToBottom();

    try {
      final answer = await PortfolioAgentService.instance.respond(message);

      if (!mounted) return;

      setState(() {
        _messages.add(_ChatMessage(text: answer, isUser: false));
        _isResponding = false;
      });
    } catch (_) {
      if (!mounted) return;

      setState(() {
        _messages.add(
          const _ChatMessage(
            text:
                'I could not answer that right now. Try asking about '
                'Flutter, projects, cloud skills, career goals, or contact information.',
            isUser: false,
          ),
        );
        _isResponding = false;
      });
    }

    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.fromLTRB(12, 12, 12, keyboardInset + 12),
      child: SafeArea(
        top: false,
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.78,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF14141C) : Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: colorScheme.primary.withValues(alpha: 0.30),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 28,
                offset: Offset(0, 12),
              ),
            ],
          ),
          child: Column(
            children: [
              _Header(onClose: () => Navigator.of(context).pop()),
              const Divider(height: 1),
              Expanded(child: _buildConversation()),
              if (!_isLoading && _loadError == null)
                _QuickQuestions(onSelected: _sendMessage),
              if (!_isLoading && _loadError == null)
                _MessageComposer(
                  controller: _messageController,
                  isSending: _isResponding,
                  onSend: _sendMessage,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConversation() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_loadError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(_loadError!, textAlign: TextAlign.center),
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
      itemCount: _messages.length + (_isResponding ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _messages.length) {
          return const _TypingBubble();
        }

        return _MessageBubble(message: _messages[index]);
      },
    );
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onClose;

  const _Header({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 14, 10, 14),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Icon(Icons.auto_awesome, color: Colors.white),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Koidio’s Portfolio Guide',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 2),
                Text(
                  'Ask about projects, skills, or experience',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Close',
            onPressed: onClose,
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}

class _QuickQuestions extends StatelessWidget {
  final ValueChanged<String> onSelected;

  const _QuickQuestions({required this.onSelected});

  @override
  Widget build(BuildContext context) {
    const questions = [
      'What Flutter projects has Koidio built?',
      'Tell me about Siikaa',
      'What cloud skills does Koidio have?',
      'How can I contact Koidio?',
    ];

    return SizedBox(
      height: 46,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        itemCount: questions.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return ActionChip(
            label: Text(questions[index]),
            onPressed: () => onSelected(questions[index]),
          );
        },
      ),
    );
  }
}

class _MessageComposer extends StatelessWidget {
  final TextEditingController controller;
  final bool isSending;
  final VoidCallback onSend;

  const _MessageComposer({
    required this.controller,
    required this.isSending,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              enabled: !isSending,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => onSend(),
              decoration: InputDecoration(
                hintText: 'Ask about Koidio’s work...',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton.filled(
            tooltip: 'Send',
            onPressed: isSending ? null : onSend,
            icon: const Icon(Icons.arrow_upward),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final _ChatMessage message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 440),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        decoration: BoxDecoration(
          color:
              message.isUser
                  ? colorScheme.primary
                  : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            height: 1.35,
            color:
                message.isUser
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

class _TypingBubble extends StatelessWidget {
  const _TypingBubble();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const SizedBox(
          width: 42,
          child: LinearProgressIndicator(minHeight: 3),
        ),
      ),
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isUser;

  const _ChatMessage({required this.text, required this.isUser});
}
