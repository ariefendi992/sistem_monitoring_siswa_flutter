part of 'jadwal_one_mapel_cubit.dart';

abstract class JadwalOneMapelState extends Equatable {
  const JadwalOneMapelState();

  @override
  List<Object> get props => [];
}

class JadwalOneMapelInitial extends JadwalOneMapelState {}

class JadwalOneMapelLoading extends JadwalOneMapelState {}

class JadwalOneMapelSuccess extends JadwalOneMapelState {
  final JadwalBelajarModel mapel;

  const JadwalOneMapelSuccess(this.mapel);

  @override
  List<Object> get props => [mapel];
}

class JadwalOneMapelFailed extends JadwalOneMapelState {
  final String error;

  const JadwalOneMapelFailed(this.error);

  @override
  List<Object> get props => [error];
}
