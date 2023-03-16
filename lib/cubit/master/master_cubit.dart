import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sistem_monitoring_siswa_flutter/models/master_model.dart';
import 'package:sistem_monitoring_siswa_flutter/services/master_service.dart';

part 'master_state.dart';

class MasterCubit extends Cubit<MasterState> {
  MasterCubit() : super(MasterInitial());

  void gethari() async {
    try {
      emit(MasterLoading());

      List<HariModel> hari = await MasterService().fetchHari();
      emit(MasterSuccess(hari));
    } catch (e) {
      emit(MasterFailure(e.toString()));
    }
  }
}
