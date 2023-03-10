// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sistem_monitoring_siswa_flutter/cubit/mapel/jadwal_today_cubit.dart';
// import 'package:sistem_monitoring_siswa_flutter/cubit/mapel/jadwal_tomorrow_cubit.dart';
// import 'package:sistem_monitoring_siswa_flutter/cubit/page_cubit.dart';
// import 'package:sistem_monitoring_siswa_flutter/ui/widgets/custom_card_jadwal_mapel.dart';
// import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

// class JadwalPelajaranPage extends StatefulWidget {
//   const JadwalPelajaranPage({Key? key}) : super(key: key);

//   @override
//   State<JadwalPelajaranPage> createState() => _JadwalPelajaranPageState();
// }

// class _JadwalPelajaranPageState extends State<JadwalPelajaranPage> {
//   @override
//   void initState() {
//     context.read<JadwalTodayCubit>().fetchJadwalToday();
//     context.read<JadwalTomorrowCubit>().fetchJadwalTomorrow();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Header
//     Widget header() {
//       return Container(
//         margin: const EdgeInsets.only(top: 60),
//         padding: EdgeInsets.symmetric(horizontal: defaultPadding),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     context.read<PageCubit>().setPage(0);
//                     Navigator.pushReplacementNamed(context, '/mainSiswa');
//                   },
//                   child: CircleAvatar(
//                     backgroundColor: kWhiteColor,
//                     child: Icon(
//                       CupertinoIcons.arrow_left_circle_fill,
//                       color: kTealColor,
//                       size: 40,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   'Jadwal Pelajaran',
//                   style: whiteTextStyle.copyWith(
//                     fontSize: 20,
//                     fontWeight: medium,
//                   ),
//                 ),
//                 const SizedBox(),
//               ],
//             )
//           ],
//         ),
//       );
//     }

//     // Body
//     Widget body() {
//       return Align(
//         // alignment: Alignment.bottomCenter,
//         child: Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: defaultPadding,
//               vertical: defaultPadding,
//             ),
//             margin: const EdgeInsets.only(top: 120),
//             height: MediaQuery.of(context).size.height,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: kBackgroundColor,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(defaultRadius),
//                 topRight: Radius.circular(defaultRadius),
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Jadwal Hari Ini :',
//                   style: greenTextStyle.copyWith(
//                     fontSize: 16,
//                     fontWeight: medium,
//                     color: kTealColor,
//                   ),
//                 ),
//                 Flexible(
//                   child: BlocBuilder<JadwalTodayCubit, JadwalTodayState>(
//                     builder: (context, state) {
//                       if (state is JadwalTodayLoading) {
//                         return const Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       } else if (state is JadwalTodaySuccess) {
//                         debugPrint('${state.jadwalBelajar.first}');
//                         if (state.jadwalBelajar.isEmpty) {
//                           return const Center(
//                             child: Text('Belum ada data.'),
//                           );
//                         } else {
//                           return ListView.builder(
//                             padding: const EdgeInsets.only(top: 12),
//                             shrinkWrap: true,
//                             itemCount: state.jadwalBelajar.length,
//                             itemBuilder: (context, index) {
//                               return CustomCardMapel(
//                                   state.jadwalBelajar[index]);
//                             },
//                           );
//                         }
//                       }

//                       return Center(
//                         child: Text(
//                           'Jadwal Hari ini tidak ada.',
//                           style: blackTextStyle.copyWith(
//                             fontSize: 14,
//                             color: kTealColor,
//                             fontWeight: medium,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Text(
//                   'Jadwal Besok :',
//                   style: blackTextStyle.copyWith(
//                     fontSize: 16,
//                     fontWeight: medium,
//                     color: kTealColor,
//                   ),
//                 ),
//                 Flexible(
//                   child: BlocBuilder<JadwalTomorrowCubit, JadwalTomorrowState>(
//                     builder: (context, state) {
//                       if (state is JadwalTomorrowLoading) {
//                         return const Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       } else if (state is JadwalTomorrowSuccess) {
//                         debugPrint('${state.jadwalTomorrow.first}');
//                         if (state.jadwalTomorrow.isEmpty) {
//                           return const Center(
//                             child: Text('Belum ada data.'),
//                           );
//                         } else {
//                           return ListView.builder(
//                             padding: const EdgeInsets.only(top: 12),
//                             shrinkWrap: true,
//                             itemCount: state.jadwalTomorrow.length,
//                             itemBuilder: (context, index) {
//                               return CustomCardMapel(
//                                   state.jadwalTomorrow[index]);
//                             },
//                           );
//                         }
//                       }
//                       return Center(
//                         child: Text(
//                           'Jadwal Hari ini tidak ada.',
//                           style: blackTextStyle.copyWith(
//                             fontSize: 14,
//                             color: kTealColor,
//                             fontWeight: medium,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             )),
//       );
//     }

//     return Scaffold(
//       backgroundColor: kGreenColor,
//       body: Stack(
//         alignment: Alignment.topCenter,
//         children: [
//           body(),
//           header(),
//         ],
//       ),
//     );
//   }
// }
