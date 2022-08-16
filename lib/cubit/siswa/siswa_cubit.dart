import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sistem_monitoring_siswa_flutter/models/siswa_model.dart';
import 'package:sistem_monitoring_siswa_flutter/services/siswa_service.dart';

part 'siswa_state.dart';

class SiswaCubit extends Cubit<SiswaState> {
  SiswaCubit() : super(SiswaInitial());

  void getOneSiswa() async {
    try {
      emit(SiswaLoading());
      SiswaModel siswa = await SiswaService().getOneSiswa();
      emit(SiswaSuccess(siswa));
    } catch (e) {
      emit(SiswaFailed(e.toString()));
    }
  }

  void generateQrCode() async {
    try {
      emit(SiswaLoading());
      SiswaModel siswa = await SiswaService().generateQrCode();
      emit(SiswaSuccess(siswa));
    } catch (e) {
      emit(SiswaFailed(e.toString()));
    }
  }
}
