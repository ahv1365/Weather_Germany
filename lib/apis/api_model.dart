import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';


class Forecast with ChangeNotifier {
  Forecast({this.forecastData, this.city, this.country,this.refreshbtn = false});

  var forecastData;
  String city;
  String country;
  bool refreshbtn;

  forecast(city) async {
    String url =
        'https://openweathermap.org/data/2.5/weather?q=$city,de&appid=b6907d289e10d714a6e88b30761fae22';

    Response response = await get(url);

    int statusCode = response?.statusCode;

    if (statusCode == 200) {
      forecastData = json.decode(response.body);

     
     print(num.parse( DateFormat('kk').format(DateTime.now())));
        refreshbtn = true;
      
      notifyListeners();
      // print(forecastData);

      return forecastData;
    } else {

      return print("Failed");
    }
  }
}
