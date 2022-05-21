import 'package:bloc/bloc.dart';
import 'package:covid19/model/prov_model.dart';
import 'package:covid19/services/prov_service.dart';
import 'package:equatable/equatable.dart';

part 'prov_state.dart';

class ProvCubit extends Cubit<ProvState> {
  ProvCubit() : super(ProvInitial());

  void getProv() async {
    try {
      emit(ProvLoading());
      List<ProvModel> prov = await ProvService().getData();
      emit(ProvSuccess(prov));
    } catch (e) {
      emit(ProvFailed(e.toString()));
    }
  }
}
