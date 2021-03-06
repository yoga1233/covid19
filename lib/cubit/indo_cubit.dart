import 'package:bloc/bloc.dart';
import 'package:covid19/model/indo_model.dart';
import 'package:equatable/equatable.dart';

import '../services/api_services.dart';

part 'indo_state.dart';

class IndoCubit extends Cubit<IndoState> {
  IndoCubit() : super(IndoInitial());

  void fetchData() async {
    try {
      emit(IndoLoading());
      IndoModel indo = await ApiService().getDataIndo();
      emit(IndoSuccess(indo));
    } catch (e) {
      emit(IndoFailed(e.toString()));
    }
  }
}
