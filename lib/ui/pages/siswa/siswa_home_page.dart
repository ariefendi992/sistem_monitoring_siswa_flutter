import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/auth/auth_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/page_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/siswa/siswa_cubit.dart';
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
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 560,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kWhiteColor2,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultRadius),
              topRight: Radius.circular(defaultRadius),
            ),
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
