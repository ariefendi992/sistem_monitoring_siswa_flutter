import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/siswa/siswa_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class SiswaMainPage extends StatelessWidget {
  const SiswaMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBlueColor,
      body: BlocBuilder<SiswaCubit, SiswaState>(
        builder: (context, state) {
          if (state is SiswaSuccess) {
            return Center(
              child: Text('Selamat Datang Siswa : ${state.siswa.namaDepan}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
