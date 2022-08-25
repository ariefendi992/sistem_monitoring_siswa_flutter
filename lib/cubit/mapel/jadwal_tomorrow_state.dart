part of 'jadwal_tomorrow_cubit.dart';

abstract class JadwalTomorrowState extends Equatable {
  const JadwalTomorrowState();

  @override
  List<Object> get props => [];
}

class JadwalTomorrowInitial extends JadwalTomorrowState {}

class JadwalTomorrowLoading extends JadwalTomorrowState {}

class JadwalTomorrowSuccess extends JadwalTomorrowState {
  final List<JadwalBelajarModel> jadwalTomorrow;

  const JadwalTomorrowSuccess(this.jadwalTomorrow);

  @override
  List<Object> get props => [jadwalTomorrow];
}

class JadwalTomorrowFailed extends JadwalTomorrowState {
  final String error;

  const JadwalTomorrowFailed(this.error);

  @override
  List<Object> get props => [error];
}
