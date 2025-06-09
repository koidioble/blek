import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramLink extends StatelessWidget {
  const InstagramLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/logos/instagram_logo.png", scale: 10),
        InkWell(
          onTap: () => _launchInsta('https://www.instagram.com/koidioy/'),
          child: Text(
            " @koidioy",
            style: GoogleFonts.ubuntuMono(
              color: Colors.lime[100],
              fontWeight: FontWeight.w300,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launchInsta(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
}
