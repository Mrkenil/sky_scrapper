import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_scrapper/provider/provider.dart';
import 'package:sky_scrapper/views/scrrens/home_page.dart';
import 'package:sky_scrapper/views/scrrens/ios_side.dart';

import 'views/scrrens/intro_screen.dart';

void main() {
  runApp(
    app(),
  );
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlatformProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => themeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ConnectionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => data(),
        ),
      ],
      child: Consumer<PlatformProvider>(
        builder: (context, value, _) => (value.Ios == false)
            ? MaterialApp(
                theme: ThemeData(
                  useMaterial3: true,
                  // colorScheme: const ColorScheme.light(),
                ),
                darkTheme: ThemeData(
                  useMaterial3: true,
                  colorScheme: const ColorScheme.dark(
                    brightness: Brightness.dark,
                  ),
                ),
                themeMode: Provider.of<themeProvider>(context).dark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                initialRoute: 'intro',
                routes: {
                  'home_page': (context) => home_page(),
                  'intro': (context) => sp_scrren(),
                },
              )
            : const CupertinoApp(
                debugShowCheckedModeBanner: false,
                home: ios_side(),
              ),
      ),
    );
  }
}
