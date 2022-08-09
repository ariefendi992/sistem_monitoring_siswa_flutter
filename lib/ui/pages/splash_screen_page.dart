import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      Timer(const Duration(seconds: 3), () {
        autoLogin();
      });
    });
  }

  void autoLogin() {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBlueColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'UPT SPF SMP NEGERI 2\nMAKASSAR',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 18,
                letterSpacing: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
