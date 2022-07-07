import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Myservices {
  final _dio = Dio();
  final dotenv = DotEnv();

  getNews(String query,String sort) async {
    try {
      await dotenv.load(fileName: ".env");

      String api = await dotenv.get("API").toString();
      var key = await dotenv.get("KEY");
      // print("$api/top-headlines?country=us&apikey=$key");
      var response =
          await _dio.get(api + "everything?q='$query'&apiKey=" + key+"&sortBy='$sort'");
      print(response.data.keys);
      return response.data;
    } catch (e) {
      print("Errror $e");
    }
  }
}
