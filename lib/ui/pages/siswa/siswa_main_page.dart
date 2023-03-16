import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/page_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/pages/siswa/profil_siswa_page.dart';
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
        case 2:
          return const ProfilSiswaPage();

        default:
          return const SiswaHomePage();
      }
    }

    Widget bottomNavigation() {
      return Container(
        width: double.infinity,
        height: 68,
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CustomNavigation(
              imageString: 'assets/images/home_blue.png',
              index: 0,
              titleMenu: 'Beranda',
            ),
            CustomNavigation(
              imageString: 'assets/images/profile_blue.png',
              index: 2,
              titleMenu: 'Profile',
            ),
          ],
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          // backgroundColor: const Color(0xff6483AF),
          backgroundColor: kBackgroundColor,
          floatingActionButton: SizedBox(
            height: 52,
            width: 52,
            child: FloatingActionButton(
              backgroundColor: kLightBlueColor,
              onPressed: () {
                context.read<PageCubit>().setPage(1);
              },
              child: CircleAvatar(
                backgroundColor: context.read<PageCubit>().state == 1
                    ? kPurpleCoror
                    : kGreyColor,
                radius: 22,
                child: CircleAvatar(
                  backgroundColor: context.read<PageCubit>().state == 1
                      ? kPurpleCoror
                      : kGreyColor,
                  child: Icon(
                    CupertinoIcons.qrcode_viewfinder,
                    color: kWhiteColor,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            elevation: 8,
            shape: const CircularNotchedRectangle(),
            child: bottomNavigation(),
          ),
          body: Stack(
            children: [
              content(currentIndex),
              // bottomNavigation(),`
            ],
          ),
        );
      },
    );
  }
}
