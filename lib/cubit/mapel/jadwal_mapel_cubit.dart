import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sistem_monitoring_siswa_flutter/models/jadwal_belajar_model.dart';
import 'package:sistem_monitoring_siswa_flutter/services/jadwal_service.dart';

part 'jadwal_mapel_state.dart';

class JadwalMapelCubit extends Cubit<JadwalMapelState> {
  JadwalMapelCubit() : super(JadwalMapelInitial());

  void fetchJadwalToday() async {
    try {
      emit(JadwalMapelLoading());
      List<JadwalBelajarModel> jadwalBelajar =
          await JadwalService().fetchJadwalToday();
      emit(JadwalMapelSuccess(jadwalBelajar));
    } catch (e) {
      emit(JadwalMapelFailed(e.toString()));
    }
  }
}
