import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/page_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/widgets/custom_card_jadwal_mapel.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class JadwalPelajaranPage extends StatelessWidget {
  const JadwalPelajaranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Header
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 60),
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<PageCubit>().setPage(0);
                    Navigator.pushReplacementNamed(context, '/mainSiswa');
                  },
                  child: CircleAvatar(
                    backgroundColor: kWhiteColor,
                    child: Icon(
                      CupertinoIcons.arrow_left_circle_fill,
                      color: kTealColor,
                      size: 40,
                    ),
                  ),
                ),
                Text(
                  'Jadwal Pelajaran',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(),
              ],
            )
          ],
        ),
      );
    }

    // Body
    Widget body() {
      Widget todayMapel() {
        return Column(
          children: const [
            CustomCardMapel(
              mapel: 'Bahasa Indonesia',
              hari: 'Rabu',
              pukul: '08:00 - 08:45',
              kelas: 'VII-1',
              guru: 'Nancy Momoland',
            ),
            CustomCardMapel(
              mapel: 'Bahasa Indonesia',
              hari: 'Rabu',
              pukul: '08:00 - 08:45',
              kelas: 'VII-1',
              guru: 'Nancy Momoland',
            ),
            CustomCardMapel(
              mapel: 'Bahasa Indonesia',
              hari: 'Rabu',
              pukul: '08:00 - 08:45',
              kelas: 'VII-1',
              guru: 'Nancy Momoland',
            ),
          ],
        );
      }

      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPadding,
          ),
          height: 625,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultRadius),
              topRight: Radius.circular(defaultRadius),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hari Ini',
                  style:
                      blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                ),
                todayMapel(),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kGreenColor,
      body: Stack(
        children: [
          header(),
          body(),
        ],
      ),
    );
  }
}
