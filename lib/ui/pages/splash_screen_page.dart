import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:sistem_monitoring_siswa_flutter/cubit/mapel/jadwal_one_mapel_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/siswa/siswa_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/secure_storage.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  String? group;
  @override
  void initState() {
    super.initState();
    setState(() {
      Timer(const Duration(seconds: 4), () {
        autoLogin();
      });
    });
  }

  void autoLogin() async {
    group = await SecureStorage().readStorage('group');
    // String? id = await SecureStorage().readStorage('id');

    if (group == 'siswa') {
      if (!mounted) return;
      context.read<SiswaCubit>().getOneSiswa();
      // context.read<JadwalOneMapelCubit>().fetchOneMapel();
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/mainSiswa', (route) => false);
    } else if (group == 'guru') {
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(context, '/mainGuru', (route) => false);
    } else {
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }

  void loguot() async {
    await SecureStorage().deleteAllStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
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
            const SizedBox(height: 14),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(kBlackColor),
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
