import 'package:flutter/material.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class DetailJadwalMapel extends StatelessWidget {
  final String mapel;
  final String hari;
  final String pukul;
  final String guru;
  final int counterPage;

  const DetailJadwalMapel({
    Key? key,
    this.counterPage = 1,
    required this.mapel,
    required this.hari,
    required this.pukul,
    required this.guru,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          mapel,
          style: blackTextStyle.copyWith(
              fontSize: 16, fontWeight: medium, color: kTealColor),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hari',
              style: blackTextStyle.copyWith(fontSize: 16, color: kGreenColor),
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
              style: blackTextStyle.copyWith(fontSize: 16, color: kGreenColor),
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
              'Guru',
              style: blackTextStyle.copyWith(fontSize: 16, color: kGreenColor),
            ),
            Text(
              guru,
              style: blackTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
