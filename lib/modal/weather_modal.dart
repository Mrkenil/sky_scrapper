class weather_modal {
  final String date;
  final double maxtemp_c;
  final double maxtemp_f;
  final double mintemp_c;
  final double mintemp_f;
  final double avgtemp_c;
  final double avgtemp_f;
  final double maxwind_kph;
  final int daily_will_it_rain;
  final String text;
  final String icon;

  weather_modal({
    required this.date,
    required this.icon,
    required this.avgtemp_c,
    required this.avgtemp_f,
    required this.daily_will_it_rain,
    required this.maxtemp_c,
    required this.maxtemp_f,
    required this.maxwind_kph,
    required this.mintemp_c,
    required this.mintemp_f,
    required this.text,
  });

  factory weather_modal.getdata({required Map data}) {
    return weather_modal(
        date: data["date"],
        icon: data["day"]["condition"]["icon"],
        avgtemp_c: data["day"]["avgtemp_c"],
        avgtemp_f: data["day"]["avgtemp_f"],
        daily_will_it_rain: data["day"]["daily_will_it_rain"],
        maxtemp_c: data["day"]["maxtemp_c"],
        maxtemp_f: data["day"]["maxtemp_f"],
        maxwind_kph: data["day"]["maxwind_kph"],
        mintemp_c: data["day"]["mintemp_c"],
        mintemp_f: data["day"]["mintemp_f"],
        text: data["day"]["condition"]["text"]);
  }
}

class weather_of_1h {
  final String time;
  final double temp_c;
  final double temp_f;
  final int is_day;
  final String text;
  final String icon;

  weather_of_1h({
    required this.text,
    required this.icon,
    required this.time,
    required this.is_day,
    required this.temp_c,
    required this.temp_f,
  });

  factory weather_of_1h.getdata({required Map data}) {
    return weather_of_1h(
        text: data["text"],
        icon: data["icon"],
        time: data["time"],
        is_day: data["is_day"],
        temp_c: data["temp_c"],
        temp_f: data["temp_f"]);
  }
}
