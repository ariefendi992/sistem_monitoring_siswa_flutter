import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/auth/auth_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/page_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/siswa/siswa_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/pages/siswa/jadawal_pelajaran.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/widgets/custom_button.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class SiswaHomePage extends StatelessWidget {
  const SiswaHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget topAction() {
      return Container(
        margin: const EdgeInsets.only(top: 35, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // 'UPT SPF SMPN2 MAKASSAR',
              'Selamat Datang...',
              style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundColor: kWhiteColor,
                  child: CircleAvatar(
                    radius: 43,
                    backgroundColor: kGreenColor2,
                    child: BlocBuilder<SiswaCubit, SiswaState>(
                      builder: (context, state) {
                        if (state is SiswaSuccess) {
                          return CircleAvatar(
                            radius: 40,
                            backgroundImage: state.siswa.profilPicture != null
                                ? AssetImage('${state.siswa.profilPicture}')
                                : const AssetImage('assets/images/nancy.jpg'),
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                BlocBuilder<SiswaCubit, SiswaState>(
                  builder: (context, state) {
                    if (state is SiswaSuccess) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${state.siswa.namaDepan} ${state.siswa.namaBelakang}',
                            style: whiteTextStyle.copyWith(
                                fontSize: 18, fontWeight: medium),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Kelas : ${state.siswa.kelas ?? 'Belum ada'}',
                            style: whiteTextStyle.copyWith(fontSize: 15),
                          ),
                          // const Spacer(),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                const Spacer(),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: kGreenColor2,
                          content: const Center(
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
                        Icons.logout_outlined,
                        color: kWhiteColor,
                        size: 30,
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget bottom() {
      Widget jadwalPelajaranHarian() {
        return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Bahasa Indonesia',
                      style: blackTextStyle.copyWith(fontWeight: medium),
                    ),
                    const Spacer(),
                    Text(
                      'Rabu, 17 Agustus 2022',
                      style: blackTextStyle.copyWith(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '08.00 - 9.30',
                      style: blackTextStyle.copyWith(
                          fontSize: 22, fontWeight: medium),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      Divider(
                        color: kGreyColor,
                        thickness: 2,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '15 Menit',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Mapel Berikutnya',
                        style: blackTextStyle.copyWith(),
                      ),
                      const SizedBox(height: 2),
                      Divider(
                        color: kGreyColor,
                        thickness: 2,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 48),
                        child: CustomButton(
                          hintText: 'Detail',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const JadwalPelajaranPage();
                                },
                              ),
                            );
                          },
                          height: 40,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }

      Widget listPelanggaran() {
        return Container(
          margin: const EdgeInsets.only(top: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Riwayat Aktifitas',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        );
      }

      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 24),
          height: 505,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kWhiteColor2,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultRadius),
              topRight: Radius.circular(defaultRadius),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              jadwalPelajaranHarian(),
              listPelanggaran(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: kGreenColor,
        body: Stack(
          children: [
            bottom(),
            topAction(),
          ],
        ));
  }
}
