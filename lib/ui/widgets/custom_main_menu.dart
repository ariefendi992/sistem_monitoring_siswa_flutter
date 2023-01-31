import 'package:flutter/material.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class MainMenu extends StatelessWidget {
  final String stringImage;
  final String title;

  const MainMenu({
    Key? key,
    required this.stringImage,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.only(left: 12, right: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff6387AF),
            Color(0xff4A4CA1),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(
            stringImage,
            width: MediaQuery.of(context).size.width / 7,
            // height: 42,
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: whiteTextStyle.copyWith(
                    fontSize: 16, fontWeight: medium, letterSpacing: 0.4),
              )
            ],
          )
        ],
      ),
    );
  }
}
