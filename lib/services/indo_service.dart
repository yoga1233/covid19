import 'package:covid19/model/indo_model.dart';
import 'package:dio/dio.dart';

class Service {
  Future<IndoModel> getData() async {
    try {
      var result = await Dio()
          .get('https://apicovid19indonesia-v2.vercel.app/api/indonesia');

      if (result.statusCode == 200) {
        IndoModel indo = IndoModel(
          dirawat: result.data['dirawat'],
          meninggal: result.data['meninggal'],
          positif: result.data['positif'],
          sembuh: result.data['sembuh'],
          lastUpdate: result.data['lastUpdate'],
        );

        return indo;
      }
      return const IndoModel();
    } catch (e) {
      rethrow;
    }
  }
}
