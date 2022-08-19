import 'package:flutter/material.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class CustomCardMapel extends StatelessWidget {
  final String mapel;
  final String hari;
  final String pukul;
  final String kelas;
  final String guru;

  const CustomCardMapel({
    Key? key,
    required this.mapel,
    required this.hari,
    required this.pukul,
    required this.kelas,
    required this.guru,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(defaultRadius),
        boxShadow: [
          BoxShadow(
            color: kGreyColor,
            offset: const Offset(0.0, 1.0), //(x,y)
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            mapel,
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hari',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
              Text(
                hari,
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
            ],
          ),
          const Divider(thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pukul',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
              Text(
                pukul,
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
            ],
          ),
          const Divider(thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kelas',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
              Text(
                kelas,
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
            ],
          ),
          const Divider(thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Guru',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
              Text(
                guru,
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
