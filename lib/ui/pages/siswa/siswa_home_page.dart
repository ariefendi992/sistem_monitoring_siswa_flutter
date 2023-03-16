// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/auth/auth_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/page_cubit.dart';
// import 'package:sistem_monitoring_siswa_flutter/cubit/auth/auth_cubit.dart';
// import 'package:sistem_monitoring_siswa_flutter/cubit/page_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/siswa/siswa_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/pages/siswa/jadwal/hari_page.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/pages/siswa/list_mapel_page.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/widgets/custom_main_menu.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/url.dart';

class SiswaHomePage extends StatelessWidget {
  const SiswaHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget topAction() {
    //   return Container(
    //     margin: const EdgeInsets.only(top: 62, left: 24, right: 24),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           // 'UPT SPF SMPN2 MAKASSAR',
    //           'Selamat Datang...',
    //           style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
    //         ),
    //         const SizedBox(height: 14),
    //         Row(
    //           children: [
    //             CircleAvatar(
    //               radius: 45,
    //               backgroundColor: kWhiteColor,
    //               child: CircleAvatar(
    //                 radius: 43,
    //                 backgroundColor: kGreenColor2,
    //                 child: BlocBuilder<SiswaCubit, SiswaState>(
    //                   builder: (context, state) {
    //                     if (state is SiswaSuccess) {
    //                       return state.siswa.profilPicture != null
    //                           ? CircleAvatar(
    //                               radius: 40,
    //                               backgroundImage: AssetImage(
    //                                   '${state.siswa.profilPicture}'))
    //                           : Icon(
    //                               CupertinoIcons
    //                                   .person_crop_circle_badge_checkmark,
    //                               size: 68,
    //                               color: kBlackColor,
    //                             );
    //                     }
    //                     return const Center(child: CircularProgressIndicator());
    //                   },
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(width: 12),
    //             BlocBuilder<SiswaCubit, SiswaState>(
    //               builder: (context, state) {
    //                 if (state is SiswaSuccess) {
    //                   return Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         '${state.siswa.firstName} ${state.siswa.lastName}',
    //                         style: whiteTextStyle.copyWith(
    //                             fontSize: 18, fontWeight: medium),
    //                       ),
    //                       const SizedBox(height: 4),
    //                       Text(
    //                         'Nisn : ${state.siswa.nisn}',
    //                         style: whiteTextStyle.copyWith(fontSize: 15),
    //                       ),
    //                       const SizedBox(height: 4),
    //                       Text(
    //                         'Kelas : ${state.siswa.kelas ?? 'Belum ada'}',
    //                         style: whiteTextStyle.copyWith(fontSize: 15),
    //                       ),
    //                       // const Spacer(),
    //                     ],
    //                   );
    //                 }
    //                 return const Center(
    //                   child: CircularProgressIndicator(),
    //                 );
    //               },
    //             ),
    //             const Spacer(),
    //             BlocConsumer<AuthCubit, AuthState>(
    //               listener: (context, state) {
    //                 if (state is AuthFailed) {
    //                   ScaffoldMessenger.of(context).showSnackBar(
    //                     SnackBar(
    //                       backgroundColor: kGreenColor2,
    //                       content: const Center(
    //                         child: CircularProgressIndicator(),
    //                       ),
    //                     ),
    //                   );
    //                 } else if (state is AuthInitial) {
    //                   context.read<PageCubit>().setPage(0);
    //                   Navigator.pushNamedAndRemoveUntil(
    //                       context, '/login', (route) => false);
    //                 }
    //               },
    //               builder: (context, state) {
    //                 if (state is AuthLoading) {
    //                   return const Center(
    //                     child: CircularProgressIndicator(),
    //                   );
    //                 }
    //                 return GestureDetector(
    //                   onTap: () {
    //                     context.read<AuthCubit>().logOut();
    //                   },
    //                   child: Icon(
    //                     Icons.logout_outlined,
    //                     color: kWhiteColor,
    //                     size: 30,
    //                   ),
    //                 );
    //               },
    //             ),
    //           ],
    //         )
    //       ],
    //     ),
    //   );
    // }

    // Widget bottom() {
    //   Widget menuUtama() {
    //     return Container(
    //       width: MediaQuery.of(context).size.width / 4,
    //       height: MediaQuery.of(context).size.height / 10.3,
    //     );
    //   }

    //   return Align(
    //     alignment: Alignment.bottomCenter,
    //     child: Container(
    //       padding:
    //           EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 24),
    //       height: 505,
    //       width: double.infinity,
    //       decoration: BoxDecoration(
    //         color: kBackgroundColor,
    //         borderRadius: BorderRadius.only(
    //           topLeft: Radius.circular(defaultRadius),
    //           topRight: Radius.circular(defaultRadius),
    //         ),
    //       ),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           menuUtama(),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    // return Scaffold(
    //   backgroundColor: kGreenColor,
    //   body: Stack(
    //     children: [
    //       bottom(),
    //       topAction(),
    //     ],
    //   ),
    // );
    Widget appBar() {
      return Container(
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width,
        // height: 146,
        height: MediaQuery.of(context).size.height,
        // padding: const EdgeInsets.only(left: 30, right: 30, bottom: 12),
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: <Color>[
        //       Color(0xff54ADAA),
        //       Color(0xff618BAE),
        //     ],
        //   ),
        // ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage('assets/images/app_bar.png'),
          ),
        ),
      );
    }

    Widget appBarTitle() {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              BlocBuilder<SiswaCubit, SiswaState>(
                builder: (context, state) {
                  if (state is SiswaSuccess) {
                    debugPrint(state.siswa.profilPicture);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            state.siswa.profilPicture != null
                                ? CircleAvatar(
                                    backgroundImage: NetworkImage('$baseUrl'
                                        '${state.siswa.profilPicture}'),
                                  )
                                : CircleAvatar(
                                    radius: 24,
                                    backgroundColor:
                                        kGradienBlue.withOpacity(0.5),
                                    child: CircleAvatar(
                                      radius: 22,
                                      backgroundColor:
                                          kGreenColor.withOpacity(0.3),
                                      child: SvgPicture.asset(
                                        'assets/images/UserCircle.svg',
                                        width: 200,
                                        fit: BoxFit.fitWidth,
                                        color: kWhiteColor.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                state.siswa.firstName.toString().length < 3
                                    ? Text(
                                        'Hi, ${state.siswa.firstName} ${state.siswa.lastName.toString().split(' ')[0]}',
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 20, fontWeight: semiBold),
                                      )
                                    : Text(
                                        'Hi, ${state.siswa.firstName}..!',
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 20,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                const SizedBox(height: 4),
                                Text(
                                  'Kelas : ${state.siswa.kelas}',
                                  style: whiteTextStyle.copyWith(fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocConsumer<AuthCubit, AuthState>(
                              listener: (context, state) {
                                if (state is AuthFailed) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  );
                                } else if (state is AuthInitial) {
                                  context.read<PageCubit>().setPage(0);
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/login', (route) => false);
                                }
                              },
                              builder: (context, state) {
                                if (state is AuthLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return GestureDetector(
                                  onTap: () {
                                    context.read<AuthCubit>().logOut();
                                  },
                                  child: Icon(
                                    CupertinoIcons.arrow_right_square,
                                    color: kWhiteColor,
                                    size: 32,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const SizedBox(),
                          ],
                        )
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
            ],
          ),
        ),
      );
    }

    Widget body() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultPadding,
          right: defaultPadding,
          top: 160,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Main Menu',
              style: blackTextStyle.copyWith(
                  color: kPurpleCoror, fontWeight: medium, fontSize: 16),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HariPageSiswa();
                    },
                  ),
                );
              },
              child: const MainMenu(
                stringImage: 'assets/images/calendar.png',
                title: 'Jadwal\nMata Pelajaran',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const ListMapelPage();
                }));
              },
              child: const MainMenu(
                stringImage: 'assets/images/books.png',
                title: 'List Mata Pelajaran',
              ),
            ),
            const MainMenu(
              stringImage: 'assets/images/list1.png',
              title: 'Kehadiran',
            ),
            const MainMenu(
              stringImage: 'assets/images/list2.png',
              title: 'Daftar Pelanggaran',
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(children: [
        appBar(),
        appBarTitle(),
        body(),
      ]),
    );
  }
}
