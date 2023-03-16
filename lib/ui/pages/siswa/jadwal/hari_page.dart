import 'package:flutter/material.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class HariPageSiswa extends StatelessWidget {
  const HariPageSiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          'Jadwal',
          style: whiteTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/app_bar.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: [
          Column(
            children: [
              Row(
                children: [],
              )
            ],
          )
        ],
      ),
      body: Center(child: Container()),
    );
  }
}
