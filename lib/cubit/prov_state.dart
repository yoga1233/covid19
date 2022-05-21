part of 'prov_cubit.dart';

abstract class ProvState extends Equatable {
  const ProvState();

  @override
  List<Object> get props => [];
}

class ProvInitial extends ProvState {}

class ProvLoading extends ProvState {}

class ProvSuccess extends ProvState {
  final List<ProvModel> prov;
  const ProvSuccess(this.prov);
  @override
  List<Object> get props => [prov];
}

class ProvFailed extends ProvState {
  final String eror;
  const ProvFailed(this.eror);

  @override
  List<Object> get props => [eror];
}
