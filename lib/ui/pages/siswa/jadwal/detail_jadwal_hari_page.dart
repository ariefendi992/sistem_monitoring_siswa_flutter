import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/mapel/jadwal_sepekan_cubit.dart';

class DetailJadwalPage extends StatefulWidget {
  const DetailJadwalPage({super.key});

  @override
  State<DetailJadwalPage> createState() => _DetailJadwalPageState();
}

class _DetailJadwalPageState extends State<DetailJadwalPage> {
  String? idHari;
  @override
  void initState() {
    super.initState();
    context.read<JadwalSepekanCubit>().getJadwalSepekan('2');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
