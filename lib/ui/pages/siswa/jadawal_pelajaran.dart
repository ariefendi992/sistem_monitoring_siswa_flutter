import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/mapel/jadwal_mapel_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/page_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/widgets/custom_card_jadwal_mapel.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class JadwalPelajaranPage extends StatefulWidget {
  const JadwalPelajaranPage({Key? key}) : super(key: key);

  @override
  State<JadwalPelajaranPage> createState() => _JadwalPelajaranPageState();
}

class _JadwalPelajaranPageState extends State<JadwalPelajaranPage> {
  @override
  void initState() {
    context.read<JadwalMapelCubit>().fetchJadwalToday();
    super.initState();
  }

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jadwal Hari Ini :',
                  style: greenTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                    color: kTealColor,
                  ),
                ),
                Flexible(
                  child: BlocBuilder<JadwalMapelCubit, JadwalMapelState>(
                    builder: (context, state) {
                      if (state is JadwalMapelLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is JadwalMapelSuccess) {
                        debugPrint('${state.jadwalBelajar.first}');
                        if (state.jadwalBelajar.isEmpty) {
                          return const Center(
                            child: Text('Belum ada data.'),
                          );
                        } else {
                          return ListView.builder(
                              padding: const EdgeInsets.only(top: 12),
                              shrinkWrap: true,
                              itemCount: state.jadwalBelajar.length,
                              itemBuilder: (context, index) {
                                return CustomCardMapel(
                                    state.jadwalBelajar[index]);
                              });
                        }
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                Text(
                  'Jadwal Besok :',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                    color: kTealColor,
                  ),
                ),
              ],
            )),
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
