import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:koidio_ble/widgets/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectWithMe extends StatelessWidget {
  final String instagramUrl = 'https://www.instagram.com/koidioble/';

  final String linkedinUrl = 'https://www.linkedin.com/in/koidioyble/';

  final String githubUrl = 'https://github.com/koidioble';

    final String facebookUrl = 'https://github.com/koidioble';

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  const ConnectWithMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Text(
            "Connect with Koidio Y. Blé",
            style: TextStyle(fontSize: 16.0, color: deepSkyBlue),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: GestureDetector(
                onTap: () => _launchUrl(facebookUrl),
                child: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: deepSkyBlue,
                  size: 30.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: GestureDetector(
                onTap: () => _launchUrl(instagramUrl),
                child: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: deepSkyBlue,
                  size: 30.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: GestureDetector(
                onTap: () => _launchUrl(linkedinUrl),
                child: FaIcon(
                  FontAwesomeIcons.linkedin,
                  color: deepSkyBlue,
                  size: 30.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: GestureDetector(
                onTap: () => _launchUrl(githubUrl),
                child: FaIcon(
                  FontAwesomeIcons.github,
                  color: deepSkyBlue,
                  size: 30.0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
