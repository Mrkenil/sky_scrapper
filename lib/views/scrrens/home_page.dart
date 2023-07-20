import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/helpers/weather_api_helper.dart';

import '../../modal/weather_modal.dart';
import '../../provider/provider.dart';
import '../../utils/time_list.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ConnectionProvider>(context, listen: false)
        .checkInternetConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: EasySearchBar(
        title: Text("WeatherApp"),
        onSearch: (val) => Provider.of<WeatherProvider>(context, listen: false)
            .searchWeather(val),
        backgroundColor: Colors.black.withOpacity(0.1),
        actions: [
          PopupMenuButton(
            color: (Provider.of<themeProvider>(context, listen: false).dark)
                ? const Color(0xFF061F3E)
                : const Color(0xFF97C8F1),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'Button 1',
                child: (Provider.of<themeProvider>(context, listen: false).dark)
                    ? const Text("Change to Dark Mode")
                    : const Text("Change to Light Mode"),
              ),
              PopupMenuItem(
                child: Provider.of<PlatformProvider>(context, listen: false).Ios
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Change  ios to android'),
                          Switch(
                            value: Provider.of<PlatformProvider>(context,
                                    listen: false)
                                .Ios,
                            onChanged: (value) {
                              Provider.of<PlatformProvider>(context,
                                      listen: false)
                                  .C_Platform(value as bool);
                            },
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Change android to ios'),
                          Switch(
                            value: Provider.of<PlatformProvider>(context,
                                    listen: false)
                                .Ios,
                            onChanged: (value) {
                              Provider.of<PlatformProvider>(context,
                                      listen: false)
                                  .C_Platform(value as bool);
                            },
                          ),
                        ],
                      ),
                value: 'Button 2',
              ),
            ],
            onSelected: (value) {
              if (value == 'Button 1') {
                Provider.of<themeProvider>(context, listen: false)
                    .themchanger();
              } else if (value == 'Button 2') {}
            },
            child: Icon(
              Icons.settings,
              color: Provider.of<themeProvider>(context).dark
                  ? Colors.white
                  : Colors.black87,
            ),
          ),
          SizedBox(
            width: w * 0.03,
          ),
        ],
      ),
      body: FutureBuilder(
        future: APIHelper.apiHelper.fetchWeatherDetails(
            Provider.of<WeatherProvider>(context, listen: true)
                .searchLocation
                .Location),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            Provider.of<data>(context, listen: false)
                .new_data(data: snapshot.data);

            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://i.pinimg.com/originals/05/5e/ac/055eac25cb71d620c44f903055f372e9.gif"),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "${Provider.of<data>(context).dat!.temp_c} C",
                            style: TextStyle(fontSize: 30),
                          ),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Icon(Icons.location_on),
                                Text("${Provider.of<data>(context).dat!.name}")
                              ],
                            ),
                          ),
                        ],
                      ),
                      height: h * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white12.withOpacity(0.2),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white12.withOpacity(0.2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(
                                  "http:${Provider.of<data>(context).dat!.icon}"),
                            )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${Provider.of<data>(context).dat!.condition}",
                            style: TextStyle(fontSize: 17),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                          itemCount:
                              Provider.of<data>(context).dat!.hour.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white12.withOpacity(0.2),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "${Provider.of<data>(context).dat!.hour[i]["time"]}",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: NetworkImage(
                                            "http:${Provider.of<data>(context).dat!.hour[i]["condition"]["icon"]}"),
                                      )),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Text(
                                      "${Provider.of<data>(context).dat!.hour[i]["temp_c"]}",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                height: 50,
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            );
          }
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://i.pinimg.com/originals/05/5e/ac/055eac25cb71d620c44f903055f372e9.gif"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Text(
              "Enter location",
              style: TextStyle(fontSize: 22),
            )),
          );
        },
      ),
    );
  }
}
