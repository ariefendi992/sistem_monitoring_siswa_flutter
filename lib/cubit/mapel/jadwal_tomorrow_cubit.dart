import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sistem_monitoring_siswa_flutter/models/jadwal_belajar_model.dart';
import 'package:sistem_monitoring_siswa_flutter/services/jadwal_service.dart';

part 'jadwal_tomorrow_state.dart';

class JadwalTomorrowCubit extends Cubit<JadwalTomorrowState> {
  JadwalTomorrowCubit() : super(JadwalTomorrowInitial());

  void fetchJadwalTomorrow() async {
    try {
      emit(JadwalTomorrowLoading());
      List<JadwalBelajarModel> jadwalTomorrow =
          await JadwalService().fetchJadwalTomorrow();
      emit(JadwalTomorrowSuccess(jadwalTomorrow));
    } catch (e) {
      emit(JadwalTomorrowFailed(e.toString()));
    }
  }
}
