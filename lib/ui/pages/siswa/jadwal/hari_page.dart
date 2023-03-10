import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/page_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/widgets/custom_card_hari.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class HariPageSiswa extends StatelessWidget {
  const HariPageSiswa({super.key});

  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage('assets/images/app_bar.png'),
          ),
        ),
      );
    }

    Widget appBarTitleWithContent() {
      return SafeArea(
        child: Column(
          children: [
            Container(
              height: 64,
              margin: const EdgeInsets.only(bottom: 12),
              padding: EdgeInsets.all(defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<PageCubit>().setPage(0);
                      Navigator.pushReplacementNamed(context, '/mainSiswa');
                    },
                    child: const Image(
                      image: AssetImage('assets/images/left_arrow.png'),
                      width: 24,
                      height: 24,
                    ),
                  ),
                  Text(
                    'Jadwal Belajar',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(defaultPadding),
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  primary: false,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: CustomHariCard(hari: 'Hari Senin'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          appBar(),
          appBarTitleWithContent(),
        ],
      ),
    );
  }
}
