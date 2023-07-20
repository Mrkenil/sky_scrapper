import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '../helpers/weather_api_helper.dart';
import '../modal/weather_modal.dart';

class data extends ChangeNotifier {
  Weather? dat;
  void new_data({required Weather? data}) {
    dat = data;
    notifyListeners();
  }
}

class WeatherProvider extends ChangeNotifier {
  SearchLocation searchLocation = SearchLocation(
    Location: "india",
    locationController: TextEditingController(),
  );

  searchWeather(String location) {
    String locat = "india";

    searchLocation.Location = (location.isEmpty) ? locat : location;
    notifyListeners();
  }

  Future<Weather?>? weatherData(String location) async {
    searchLocation.weather =
        (await APIHelper.apiHelper.fetchWeatherDetails(location));
    return searchLocation.weather;
  }
}

class ConnectionProvider extends ChangeNotifier {
  Connectivity connectivity = Connectivity();

  ConnectionModel connectivityModel =
      ConnectionModel(connectivityStatus: "waiting");

  void checkInternetConnectivity() {
    connectivityModel.connectivityStream = connectivity.onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        connectivityModel.connectivityStatus = "WiFi";
        notifyListeners();
      } else if (connectivityResult == ConnectivityResult.mobile) {
        connectivityModel.connectivityStatus = "MobileData";
        notifyListeners();
      } else {
        connectivityModel.connectivityStatus = "waiting";
        notifyListeners();
      }
    });
  }
}

class themeProvider extends ChangeNotifier {
  bool dark = true;
  void themchanger() {
    dark = !dark;
    notifyListeners();
  }
}

class PlatformProvider extends ChangeNotifier {
  bool Ios = false;
  void C_Platform(bool n) {
    Ios = n;
    notifyListeners();
  }
}
