import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koidio_ble/widgets/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioLink extends StatelessWidget {
  const PortfolioLink({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchURL('https://koidioble.github.io/portfolio/'),
      child: Container(
        decoration: BoxDecoration(color: midOlive),
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Text(
            "https://koidioble.github.io/portfolio/",
            style: GoogleFonts.ubuntuMono(
              color: lime100,
              fontWeight: FontWeight.w300,
              decorationColor: lime100,
              decorationThickness: 6,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
}
