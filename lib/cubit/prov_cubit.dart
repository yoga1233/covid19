import 'package:bloc/bloc.dart';
import 'package:covid19/model/prov_model.dart';
import 'package:covid19/services/api_services.dart';
import 'package:equatable/equatable.dart';

part 'prov_state.dart';

class ProvCubit extends Cubit<ProvState> {
  ProvCubit() : super(ProvInitial());

  void getProv() async {
    try {
      emit(ProvLoading());
      List<ProvModel> prov = await ApiService().getDataProv();
      emit(ProvSuccess(prov));
    } catch (e) {
      emit(ProvFailed(e.toString()));
    }
  }
}
