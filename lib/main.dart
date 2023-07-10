import 'package:flutter/material.dart';
import 'package:sky_scrapper/views/scrrens/home_page.dart';

void main() {
  runApp(
    app(),
  );
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        'home_page': (context) => home_page(),
      },
    );
  }
}
