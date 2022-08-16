import 'package:flutter/material.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class GuruMainPage extends StatelessWidget {
  const GuruMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBlueColor,
      body: const Center(
        child: Text('Selamat Datang Guru'),
      ),
    );
  }
}
