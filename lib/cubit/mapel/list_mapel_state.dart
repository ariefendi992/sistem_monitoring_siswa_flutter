part of 'list_mapel_cubit.dart';

abstract class ListMapelState extends Equatable {
  const ListMapelState();

  @override
  List<Object> get props => [];
}

class ListMapelInitial extends ListMapelState {}

class ListMapelLoading extends ListMapelState {}

class ListMapelSuccess extends ListMapelState {
  final List<MapelModel> mapel;

  const ListMapelSuccess(this.mapel);

  @override
  List<Object> get props => [mapel];
}

class ListMapelFailed extends ListMapelState {
  final String error;

  const ListMapelFailed(this.error);

  @override
  List<Object> get props => [error];
}
