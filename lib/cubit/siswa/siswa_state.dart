part of 'siswa_cubit.dart';

abstract class SiswaState extends Equatable {
  const SiswaState();

  @override
  List<Object> get props => [];
}

class SiswaInitial extends SiswaState {}

class SiswaLoading extends SiswaState {}

class SiswaSuccess extends SiswaState {
  final SiswaModel siswa;

  const SiswaSuccess(this.siswa);

  @override
  List<Object> get props => [siswa];
}

class SiswaFailed extends SiswaState {
  final String error;

  const SiswaFailed(this.error);

  @override
  List<Object> get props => [error];
}
