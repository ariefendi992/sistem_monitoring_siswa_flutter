import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/page_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/pages/guru/guru_home_page.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/pages/guru/guru_profil_page.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/widgets/custom_bottom_navigation.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class GuruMainPage extends StatelessWidget {
  const GuruMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const GuruHomePage();
        case 1:
          return const GuruProfilPage();
        default:
          return const GuruHomePage();
      }
    }

    Widget bottomNavigation() {
      return Container(
        width: double.infinity,
        height: 43,
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CustomNavigation(
              imageString: 'assets/images/home.png',
              index: 0,
              titleMenu: 'Home',
              // colorIcon: Color(0xffB02B36),
              // colorText: Color(0xffB02B36),
            ),
            CustomNavigation(
              imageString: 'assets/images/profile.png',
              index: 1,
              titleMenu: 'Akun',
              // colorIcon: Color(0xffB02B36),
              // colorText: Color(0xffB02B36),
            ),
          ],
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, index) {
        return Scaffold(
            backgroundColor: kBackgroundColor,
            floatingActionButton: SizedBox(
              height: 42,
              width: 42,
              child: FloatingActionButton(
                backgroundColor: kLightBlueColor,
                onPressed: () {},
                child: CircleAvatar(
                  backgroundColor: kBlueColor,
                  radius: 18,
                  child: CircleAvatar(
                    backgroundColor: kBlueColor,
                    child: Icon(
                      CupertinoIcons.qrcode_viewfinder,
                      color: kWhiteColor,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            bottomNavigationBar: BottomAppBar(
              elevation: 8,
              shape: const CircularNotchedRectangle(),
              child: bottomNavigation(),
            ),
            body: Stack(
              children: [
                content(index),
              ],
            ));
      },
    );
  }
}
