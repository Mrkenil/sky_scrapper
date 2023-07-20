import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/helpers/weather_api_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../../modal/weather_modal.dart';
import '../../provider/provider.dart';
import '../../utils/time_list.dart';

class ios_side extends StatefulWidget {
  const ios_side({super.key});

  @override
  State<ios_side> createState() => _ios_sideState();
}

class _ios_sideState extends State<ios_side> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      navigationBar: CupertinoNavigationBar(
        middle: Text("WeatherApp"),
        trailing: Material(
          child: IconButton(
            color: (Provider.of<themeProvider>(context, listen: false).dark)
                ? const Color(0xFF061F3E)
                : const Color(0xFF97C8F1),
            onPressed: () {
              showCupertinoModalPopup<void>(
                context: context,
                builder: (BuildContext context) {
                  return CupertinoActionSheet(
                    title: const Text('Options'),
                    actions: [
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Provider.of<themeProvider>(context, listen: false)
                              .themchanger();
                          Navigator.pop(context);
                        },
                        child:
                            (Provider.of<themeProvider>(context, listen: false)
                                    .dark)
                                ? const Text('Change to Light Mode')
                                : const Text('Change to Dark Mode'),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          Provider.of<PlatformProvider>(context, listen: false)
                              .C_Platform(false);
                          Navigator.pop(context);
                        },
                        child: (Provider.of<PlatformProvider>(context,
                                    listen: false)
                                .Ios)
                            ? const Text('Change iOS to Android')
                            : const Text('Change Android to iOS'),
                      ),
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.settings),
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/originals/05/5e/ac/055eac25cb71d620c44f903055f372e9.gif"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: h * 0.12,
              ),
              CupertinoSearchTextField(
                onChanged: (val) =>
                    Provider.of<WeatherProvider>(context, listen: false)
                        .searchWeather(val),
                placeholder: 'Search',
              ),
              Container(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${Provider.of<data>(context).dat!.temp_c}",
                      style: TextStyle(fontSize: 30),
                    ),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Icon(
                            CupertinoIcons.location_solid,
                            color: Colors.black,
                          ),
                          Text("${Provider.of<data>(context).dat!.region}")
                        ],
                      ),
                    ),
                  ],
                ),
                height: h * 0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color:
                      CupertinoColors.extraLightBackgroundGray.withOpacity(0.2),
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
                height: h * 0.2,
                child: ListView.builder(
                    itemCount: Provider.of<data>(context).dat!.hour.length,
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
      ),
    );
  }
}
