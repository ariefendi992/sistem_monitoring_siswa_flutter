import 'package:flutter/material.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class QrCodeSiswa extends StatelessWidget {
  const QrCodeSiswa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenColor,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 70),
            Text(
              'Scan QR Code',
              style: whiteTextStyle.copyWith(fontWeight: bold, fontSize: 24),
            ),
            const SizedBox(height: 70),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 90),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/qr_code.png'),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Scan QR Code for Absen Siswa',
              style: whiteTextStyle.copyWith(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
