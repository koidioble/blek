import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkedinLink extends StatelessWidget {
  const LinkedinLink({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Image.asset("assets/logos/linkedin_logo.png", scale: 7),
      onTap: () => _launchLinkedin('https://www.linkedin.com/in/koidioyble/'),
    );
  }

  Future<void> _launchLinkedin(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw "Could not launch $url";
    }
  }
}
