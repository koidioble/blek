import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailButton extends StatelessWidget {
  final String emailAddress;

  const EmailButton({super.key, required this.emailAddress});

  Future<void> _createMail(String emailAddress) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
      query: encodeQueryParameters({'subject': 'Hello from my app'}),
    );

    try {
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $emailLaunchUri';
      }
    } catch (e) {
      print('Error launching email: $e');
      // You can show an error message to the user here
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map(
          (e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _createMail('koidioble@gmail.com');
      },
      child: Image.asset("assets/logos/gmail_logo.png", scale: 60),
    );
  }
}
