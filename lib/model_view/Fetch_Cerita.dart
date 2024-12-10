import 'dart:convert';
import 'package:cerita_saku/model/Cerita.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Repository {
  var apiUrl = 'https://ceritasakuapi-default-rtdb.firebaseio.com/jsondata/dongeng.json?auth=JV5Tv3e7EVEsIfNlbglrEdweWHJRfEQi9eXTqheL';
  // var apiUrl = 'http://192.168.18.41:8000/api/dongeng';
  Future<List<Cerita>> fetchData() async {
    Response response = await http.get(Uri.parse(apiUrl));
    List<Cerita> dataDongeng;

    if (response.statusCode == 200) {
      List<dynamic> listJson = json.decode(response.body)["dongeng"];
      dataDongeng = listJson.map((e) => Cerita.fromJson(e)).toList();
      // Map<String, dynamic> listJson = json.decode(response.body);
      // dataGunung = listJson.values.map((e) {
      //   return Gunung.fromJson(e);
      // }).toList();
      print(dataDongeng);
      return dataDongeng;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
