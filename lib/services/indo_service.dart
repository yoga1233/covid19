import 'package:covid19/model/indo_model.dart';
import 'package:dio/dio.dart';

class Service {
  Future<IndoModel> getData() async {
    try {
      var result = await Dio()
          .get('https://apicovid19indonesia-v2.vercel.app/api/indonesia');

      if (result.statusCode == 200) {
        IndoModel indo = IndoModel.fromJson(result.data);

        return indo;
      }
      return IndoModel();
    } catch (e) {
      rethrow;
    }
  }
}
