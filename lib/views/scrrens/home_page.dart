import 'package:flutter/material.dart';
import 'package:sky_scrapper/helpers/weather_api_helper.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WeatherApp"),
      ),
      body: FutureBuilder(
        future: Api_helper.api_helper.apicall(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(""),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
