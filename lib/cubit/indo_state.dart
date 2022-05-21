part of 'indo_cubit.dart';

abstract class IndoState extends Equatable {
  const IndoState();

  @override
  List<Object> get props => [];
}

class IndoInitial extends IndoState {}

class IndoLoading extends IndoState {}

class IndoSuccess extends IndoState {
  final IndoModel indo;
  const IndoSuccess(this.indo);
  @override
  List<Object> get props => [indo];
}

class IndoFailed extends IndoState {
  final String error;
  const IndoFailed(this.error);
  @override
  List<Object> get props => [error];
}
