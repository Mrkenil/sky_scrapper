import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Duration duration = Duration(seconds: 3);

    Timer(duration, () {
      Navigator.of(context).pushReplacementNamed('home_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Provider.of<themeProvider>(context).dark
          ? const Color(0xFF97DAE7).withOpacity(
              0.4,
            )
          : const Color(0xFF97DAE7),
    ));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Provider.of<themeProvider>(context).dark
          ? const Color(0xFFF3D4D9).withOpacity(
              0.4,
            )
          : const Color(0xFF061F3E),
    ));
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(Provider.of<themeProvider>(context,
                          listen: false)
                      .dark
                  ? "https://i.pinimg.com/originals/05/5e/ac/055eac25cb71d620c44f903055f372e9.gif"
                  : "https://i.pinimg.com/originals/05/5e/ac/055eac25cb71d620c44f903055f372e9.gif"),
              fit: BoxFit.cover),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: h * 0.3,
              width: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://o.remove.bg/downloads/be1d2c09-18f5-4216-af3e-b9d9dbd96a3b/png-clipart-cloud-rain-sunlight-weather-cloud-text-cloud-removebg-preview.png",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(h * 0.07),
              ),
            ),
            Text(
              "Weather",
              style: TextStyle(
                  color: Provider.of<themeProvider>(context).dark
                      ? Colors.black87
                      : Colors.teal,
                  fontSize: 25),
            ),
            Text(
              "Your Quick Weather Report...",
              style: TextStyle(
                  color: Provider.of<themeProvider>(context).dark
                      ? Colors.black
                      : Colors.white,
                  fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
