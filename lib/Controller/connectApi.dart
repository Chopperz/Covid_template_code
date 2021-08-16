import 'dart:convert';

import 'package:flutter_for_test/Model/modelApi.dart';
import 'package:http/http.dart' as http;

class ServiceCovid {
  static Future<CovidModelData?> connectCovid() async {
    Uri _url = Uri.parse(
        'https://static.easysunday.com/covid-19/getTodayCases.json?fbclid=IwAR2MttxJqqY-eVzi_y-c-7b2pmMzgk6sLrlsTMORrzqWpP1GRXERSO_xHfc');
    final http.Response response = await http.get(_url);
    try {
      if (response.statusCode == 200) {
        final CovidModelData data =
            CovidModelData.fromJson(json.decode(response.body));
        return data;
      } else {
        print(response.statusCode);
        print(response.body);
        return null;
      }
    } catch (err) {
      throw err.toString();
    }
  }
}
