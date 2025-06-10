import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubLink extends StatelessWidget {
  const GithubLink({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Image.asset("assets/logos/github_logo.png", scale: 23),
      onTap: () => _launchGitHub('https://github.com/koidioble'),
    );
  }

  Future<void> _launchGitHub(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw "Could not launch $url";
    }
  }
}
