part of 'jadwal_today_cubit.dart';

abstract class JadwalTodayState extends Equatable {
  const JadwalTodayState();

  @override
  List<Object> get props => [];
}

class JadwalTodayInitial extends JadwalTodayState {}

class JadwalTodayLoading extends JadwalTodayState {}

class JadwalTodaySuccess extends JadwalTodayState {
  final List<JadwalBelajarModel> jadwalBelajar;

  const JadwalTodaySuccess(this.jadwalBelajar);

  @override
  List<Object> get props => [jadwalBelajar];
}

class JadwalTodayFailed extends JadwalTodayState {
  final String error;

  const JadwalTodayFailed(this.error);

  @override
  List<Object> get props => [error];
}
