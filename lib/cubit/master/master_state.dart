part of 'master_cubit.dart';

abstract class MasterState extends Equatable {
  const MasterState();

  @override
  List<Object> get props => [];
}

class MasterInitial extends MasterState {}

class MasterLoading extends MasterState {}

class MasterSuccess extends MasterState {
  final List<HariModel> hari;

  const MasterSuccess(this.hari);

  @override
  List<Object> get props => [hari];
}

class MasterFailure extends MasterState {
  final String error;

  const MasterFailure(this.error);

  @override
  List<Object> get props => [error];
}
