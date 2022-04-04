import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'dart:convert';
import 'package:wether_project/modals/modal.dart';
import 'drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Weather?> weatherData({required String? location}) async {
    String api =
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=96fea5295d9d749219972c9af19424db";
    http.Response res = await http.get(Uri.parse(api));
    if (res.statusCode == 200) {
      Map<String, dynamic> weather = jsonDecode(res.body);
      return Weather.fromJson(weather);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    dynamic result = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: const Icon(
                Icons.location_on,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: FutureBuilder(
          future: weatherData(location: result ?? "Surat"),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: SelectableText(
                  "Error : ${snapshot.error}",
                  style: const TextStyle(color: Colors.red, fontSize: 25),
                ),
              );
            } else if (snapshot.hasData) {
              Weather data = snapshot.data;
              return Stack(children: [
                (data.main == "Rain")
                    ? Image.asset(
                        "assets/images/rainy.gif",
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : (data.main == "Clear")
                        ? Image.asset(
                            "assets/images/sunny.gif",
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : (data.main == "Snow")
                            ? Image.asset(
                                "assets/images/heavy.gif",
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )
                            : (data.main == "Clouds")
                                ? Image.asset(
                                    "assets/images/cloudly.jpg",
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                : (data.main == "Smoke")
                                    ? Image.asset(
                                        "assets/images/Smoke.jpg",
                                        height: double.infinity,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        "assets/images/moon.jpg",
                                        height: double.infinity,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black38,
                  ),
                ),
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      " ${data.name} (${data.country})",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  Text(
                    "${data.description}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 200,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.thermostat_outlined,
                                        size: 35,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${data.temp!.toStringAsFixed(2)}° C",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "Temperature",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.speed_outlined,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${data.speed} km/h",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "Wind Speed",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 60,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.cloud_queue_rounded,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${data.all}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "Clouds",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.arrow_circle_up_outlined,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${data.deg}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "Wind Degree",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Additional information",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 100,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Humidity",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Icon(
                                  Icons.cloud_circle,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                  height: 10,
                                ),
                                Text(
                                  "${data.humidity}%",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Visibility",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                  height: 10,
                                ),
                                Text(
                                  "${data.visibility}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "SunRise",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const FaIcon(
                                  FontAwesomeIcons.solidSun,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                  height: 10,
                                ),
                                Text(
                                  data.sunrise!.toStringAsFixed(0),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ]);
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
