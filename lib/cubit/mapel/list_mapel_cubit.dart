import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sistem_monitoring_siswa_flutter/models/mapel_model.dart';
import 'package:sistem_monitoring_siswa_flutter/services/mapel_service.dart';

part 'list_mapel_state.dart';

class ListMapelCubit extends Cubit<ListMapelState> {
  ListMapelCubit() : super(ListMapelInitial());

  void fetchListMapel() async {
    try {
      emit(ListMapelLoading());
      List<MapelModel> mapel = await MapelService().getMapel();
      emit(ListMapelSuccess(mapel));
    } catch (e) {
      emit(ListMapelFailed(e.toString()));
    }
  }
}
