import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'boxes.dart';
import 'login.dart';
import 'long.dart';
import 'recommend.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
          gradient: RadialGradient(
              radius: 1.1,
              // begin: Alignment.topCenter,
              // end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 55, 35, 187),
            //Color.fromARGB(255, 24, 14, 86),
            Color.fromARGB(255, 54, 0, 90)
          ])),
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Column(children: [
            SizedBox(
              height: height / 40,
            ),
            Column(
              children: [
                SizedBox(
                  height: height / 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 10,
                          ),
                          Image.asset(
                            "assets/images/Ham.png",
                            color: Colors.white,
                            scale: 15,
                          ),
                        ],
                      ),
                      Text(
                        "Dashboard",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        width: 35,
                      ),
                    ]),
              ],
            ),
            SizedBox(
              height: height / 35,
            ),
            Container(
                width: width - 40,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Active Alarms",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(89, 255, 255, 255),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "3 Assets",
                      style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    Row(
                      children: [
                        Text(
                          "show assets",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(89, 255, 255, 255),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: Color.fromARGB(89, 255, 255, 255),
                        ),
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: height / 20,
            ),
            Container(
                width: width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              "Favorite assets ",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(
                            Icons.favorite_border_outlined,
                            color: Color.fromARGB(89, 255, 255, 255),
                            size: 17,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Show All",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(89, 255, 255, 255),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )),
            SizedBox(
              height: height / 30,
            ),
            SizedBox(
              height: height / 6,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 3,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Box(list[index].title, list[index].description,
                      list[index].image, list[index].change);
                },
                itemCount: 4,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Container(
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended",
                      style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                    ),
                    Text(
                      "View More",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(89, 255, 255, 255),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Column(children: [
              Recommended("QTUM", "575.213", "qtum", "-0.03%", Colors.red),
              SizedBox(
                height: 10,
              ),
              Recommended("ADA", "784.33", "ada", "+5.7%", Colors.green),
              SizedBox(
                height: 10,
              ),
              Recommended("XRP", "1.223", "xrp", "+1.35%", Colors.green),
              SizedBox(
                height: 10,
              ),
              Recommended("EOS", "7.80", "eos", "-10.2%", Colors.red),
              SizedBox(
                height: 10,
              ),
              Recommended("BTC", "22000.0", "btc", "-0.03%", Colors.red),
            ]),
          ])),
          floatingActionButton: SpeedDial(
            direction: SpeedDialDirection.down,
            buttonSize: Size(45, 45),
            icon: Icons.alarm_add,
            iconTheme: IconThemeData(size: 45),
            activeIcon: Icons.close,
            elevation: 0.0,
            activeBackgroundColor: Color.fromARGB(255, 54, 0, 90),
            animatedIconTheme: IconThemeData(size: 28.0),
            backgroundColor: Color.fromARGB(0, 255, 255, 255),
            foregroundColor: Color.fromARGB(255, 255, 255, 255),
            visible: true,
            curve: Curves.bounceInOut,
            children: [
              SpeedDialChild(
                child: Icon(Icons.alarm_add, color: Colors.white),
                backgroundColor: Color.fromARGB(255, 54, 0, 90),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Simple()),
                  );
                },
                label: 'Simple Alarm',
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                labelBackgroundColor: Colors.black,
              ),
              SpeedDialChild(
                child: Image.asset(
                  "assets/images/Long.png",
                  color: Colors.white,
                ),
                backgroundColor: Color.fromARGB(255, 54, 0, 90),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Long()),
                  );
                },
                label: 'Future Positions',
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                labelBackgroundColor: Colors.black,
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        ),
      ),
    );
  }

  List<Box> list = [
    Box("BTC", "19900", "btc", "-0.03%"),
    Box("ETC", "15.0", "etc", "-0.1%"),
    Box("ETH", "1100.0", "eth", "-7.49%"),
    Box("LTC", "452.0", "ltc", "-2.52%"),
  ];

}

class Currency {
  // final int price;
  final String name;
  Currency({
    // this.price,
    required this.name,
  });
}

/// Fetches the latest KuCoin price for [name] (e.g. "BTC").
///
/// Returns null when the request fails or the symbol is unknown, so callers
/// can show an error state instead of crashing.
Future<String?> getRequest(String name) async {
  try {
    final response = await http
        .get(Uri.parse("https://api.kucoin.com/api/v1/prices"))
        .timeout(const Duration(seconds: 10));
    if (response.statusCode != 200) return null;
    final data = json.decode(response.body)["data"];
    final price = data is Map ? data[name] : null;
    return price?.toString();
  } catch (_) {
    // Network error, timeout, or a CORS block on web.
    return null;
  }
}
