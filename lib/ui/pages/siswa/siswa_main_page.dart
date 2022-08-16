import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/page_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/pages/siswa/qr_code_siswa_page.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/pages/siswa/siswa_home_page.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/widgets/custom_bottom_navigation.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class SiswaMainPage extends StatelessWidget {
  const SiswaMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const SiswaHomePage();
        case 1:
          return const QrCodeSiswa();

        default:
          return const SiswaHomePage();
      }
    }

    Widget bottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: kWhiteColor,
            // border: Border(top: BorderSide(width: 1.0, color: kBlackColor)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              CustomNavigation(
                icons: Icons.home,
                index: 0,
                titleMenu: 'Home',
              ),
              CustomNavigation(
                icons: CupertinoIcons.qrcode,
                index: 1,
                titleMenu: 'QR Code',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kGreenColor,
          body: Stack(children: [
            content(currentIndex),
            bottomNavigation(),
          ]),
        );
      },
    );
  }
}
