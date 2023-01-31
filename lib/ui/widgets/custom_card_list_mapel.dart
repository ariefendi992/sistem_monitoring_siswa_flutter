import 'package:flutter/material.dart';
import 'package:sistem_monitoring_siswa_flutter/models/mapel_model.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class CustomCardListMapel extends StatelessWidget {
  final MapelModel mapel;
  // final String namaMapel;
  // final String guruMape;

  const CustomCardListMapel(
    this.mapel, {
    // required this.guruMape,
    // required this.namaMapel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.only(left: 12, right: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff618EAE),
            Color(0xff618BAE),
          ],
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/book1.png',
            width: MediaQuery.of(context).size.width / 8,
            // height: 42,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${mapel.mapel}',
                        overflow: TextOverflow.ellipsis,
                        style: whiteTextStyle.copyWith(
                            fontWeight: medium, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      '${mapel.guruMapel}',
                      style: whiteTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
