import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_scrapper/views/scrrens/splashScrren.dart';

import 'home_page.dart';

class sp_scrren extends StatefulWidget {
  const sp_scrren({super.key});

  @override
  State<sp_scrren> createState() => _sp_scrrenState();
}

class _sp_scrrenState extends State<sp_scrren> {
  Future<bool> Visited() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool visited = pref.getBool("isIntroVisited") ?? false;
    return visited;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => (true) ? home_page() : SplashScreenPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://user-images.githubusercontent.com/59525449/92932261-ebd85c00-f444-11ea-9735-7b6871b02e72.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
