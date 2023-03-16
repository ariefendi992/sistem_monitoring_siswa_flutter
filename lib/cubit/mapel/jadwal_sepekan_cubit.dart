import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sistem_monitoring_siswa_flutter/models/jadwal_belajar_model.dart';
import 'package:sistem_monitoring_siswa_flutter/services/mapel_service.dart';

part 'jadwal_sepekan_state.dart';

class JadwalSepekanCubit extends Cubit<JadwalSepekanState> {
  JadwalSepekanCubit() : super(JadwalSepekanInitial());

  Future<void> getJadwalSepekan(String hariId) async {
    try {
      emit(JadwalSepekanLoading());
      List<JadwalBelajarModel> jadwal =
          await MapelService().getMapelByHari(hariId);
      emit(JadwalSepekanSuccess(jadwal));
    } catch (e) {
      emit(JadwalSepekanFailure(e.toString()));
    }
  }
}
