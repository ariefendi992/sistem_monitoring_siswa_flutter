import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sistem_monitoring_siswa_flutter/models/jadwal_belajar_model.dart';
import 'package:sistem_monitoring_siswa_flutter/services/jadwal_service.dart';

part 'jadwal_one_mapel_state.dart';

class JadwalOneMapelCubit extends Cubit<JadwalOneMapelState> {
  JadwalOneMapelCubit() : super(JadwalOneMapelInitial());

  void fetchOneMapel() async {
    try {
      emit(JadwalOneMapelLoading());

      JadwalBelajarModel mapel = await JadwalService().fetchOneMapel();

      emit(JadwalOneMapelSuccess(mapel));
    } catch (e) {
      emit(JadwalOneMapelFailed(e.toString()));
    }
  }
}
