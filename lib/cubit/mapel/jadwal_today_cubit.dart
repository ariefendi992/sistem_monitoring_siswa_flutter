import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sistem_monitoring_siswa_flutter/models/jadwal_belajar_model.dart';
import 'package:sistem_monitoring_siswa_flutter/services/jadwal_service.dart';

part 'jadwal_today_state.dart';

class JadwalTodayCubit extends Cubit<JadwalTodayState> {
  JadwalTodayCubit() : super(JadwalTodayInitial());

  void fetchJadwalToday() async {
    try {
      emit(JadwalTodayLoading());
      List<JadwalBelajarModel> jadwalBelajar =
          await JadwalService().fetchJadwalToday();
      emit(JadwalTodaySuccess(jadwalBelajar));
    } catch (e) {
      emit(JadwalTodayFailed(e.toString()));
    }
  }

  
}
