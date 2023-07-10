import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sky_scrapper/modal/weather_modal.dart';

import '../utils/time_list.dart';

class Api_helper {
  Api_helper._();

  static final Api_helper api_helper = Api_helper._();

  apicall() async {
    http.Response response = await http.get(
      Uri.parse(
          "https://api.weatherapi.com/v1/forecast.json?key=ee24b71c01a9469d8c694430231007%20&q=india&days=1&aqi=no&alerts=no"),
    );

    if (response.statusCode == 200) {
      Map all_data = jsonDecode(response.body);

      location = all_data["location"]["name"];

      List forecastday = all_data["forecast"]["forecastday"];

      Map data = forecastday[0];

      weather_modal.getdata(data: data);

      List hourData = data["hour"];

      List<weather_of_1h> data_of_time = [];

      hourData.forEach((element) {
        data_of_time.add(element);
      });
    }
  }
}
