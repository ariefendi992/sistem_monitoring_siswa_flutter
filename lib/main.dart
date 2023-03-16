import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/auth/auth_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/mapel/jadwal_one_mapel_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/mapel/jadwal_sepekan_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/mapel/jadwal_today_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/mapel/jadwal_tomorrow_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/mapel/list_mapel_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/master/master_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/page_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/siswa/siswa_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/pages/auth/login_page.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/pages/guru/guru_main_page.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/pages/siswa/siswa_main_page.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/pages/splash_screen_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => SiswaCubit(),
        ),
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => JadwalTodayCubit(),
        ),
        BlocProvider(
          create: (context) => JadwalTomorrowCubit(),
        ),
        BlocProvider(
          create: (context) => JadwalOneMapelCubit(),
        ),
        BlocProvider(
          create: (context) => ListMapelCubit(),
        ),
        BlocProvider(
          create: (context) => JadwalSepekanCubit(),
        ),
        BlocProvider(
          create: (context) => MasterCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Roboto'),
        routes: {
          '/': (context) => const SplashScreenPage(),
          '/login': (context) => const LoginPage(),
          '/mainSiswa': (context) => const SiswaMainPage(),
          '/mainGuru': (context) => const GuruMainPage(),
        },
      ),
    );
  }
}
