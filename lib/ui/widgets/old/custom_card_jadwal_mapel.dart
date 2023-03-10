// import 'package:flutter/material.dart';
// import 'package:sistem_monitoring_siswa_flutter/models/jadwal_belajar_model.dart';
// import 'package:sistem_monitoring_siswa_flutter/ui/widgets/custom_detail_mapel.dart';
// import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

// class CustomCardMapel extends StatelessWidget {
//   final JadwalBelajarModel jadwalBelajar;

//   const CustomCardMapel(
//     this.jadwalBelajar, {
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//       decoration: BoxDecoration(
//         color: kWhiteColor,
//         borderRadius: BorderRadius.circular(defaultRadius),
//         boxShadow: [
//           BoxShadow(
//             color: kGreyColor,
//             offset: const Offset(0.0, 1.0), //(x,y)
//             blurRadius: 4.0,
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           DetailJadwalMapel(
//             mapel: jadwalBelajar.mapel!,
//             hari: '${jadwalBelajar.hari}',
//             pukul: '${jadwalBelajar.mulai} - ${jadwalBelajar.selesai}',
//             guru: '${jadwalBelajar.namaGuru}',
//           ),
//         ],
//       ),
//     );
//   }
// }
