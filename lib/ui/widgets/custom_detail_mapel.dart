import 'package:flutter/material.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class DetailJadwalMapel extends StatelessWidget {
  final String mapel;
  final String hari;
  final String pukul;
  final String kelas;
  final String guru;

  const DetailJadwalMapel({
    Key? key,
    required this.mapel,
    required this.hari,
    required this.pukul,
    required this.kelas,
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
              'Kelas',
              style: blackTextStyle.copyWith(fontSize: 16, color: kGreenColor),
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
