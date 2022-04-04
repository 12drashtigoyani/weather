import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List country = [
    "Usa",
    "London",
    "Germany",
    "Nepal",
    "Europe",
    "Sweden",
    "Dubai",
    "Japan",
    "Chine",
    "Russia",
    "Switzerland",
    "Nederland",
    "California",
    "New York",
    "Canada",
    "Brazil",
  ];

  List cities = [
    "Surat",
    "Mumbai",
    "Kolkata",
    "Delhi",
    "Bangalore",
    "Hyderabad",
    "Jaipur",
    "Chennai",
    "Ahmedabad",
    "Meghalaya",
    "Pune",
    "Rajkot"
  ];

  bool active = false;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/building.jpg"),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(color: Colors.black38),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ExpansionPanelList(
                        elevation: 0,
                        dividerColor: Colors.white,
                        expansionCallback: (panelIndex, isExpanded) {
                          active = !active;
                          setState(() {});
                        },
                        children: <ExpansionPanel>[
                          ExpansionPanel(
                            backgroundColor: Colors.transparent,
                            headerBuilder: (context, isExpanded) {
                              return const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "  Cities",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            },
                            body: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                cities.length,
                                (i) => ListTile(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('homepage',
                                        arguments: cities[i]);
                                  },
                                  leading: const Icon(
                                    Icons.location_city,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    cities[i],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                            isExpanded: active,
                            canTapOnHeader: true,
                          ),
                        ],
                      ),
                    ),
                    ExpansionPanelList(
                      elevation: 0,
                      dividerColor: Colors.white,
                      expansionCallback: (panelIndex, isExpanded) {
                        isActive = !isActive;
                        setState(() {});
                      },
                      children: <ExpansionPanel>[
                        ExpansionPanel(
                          backgroundColor: Colors.transparent,
                          headerBuilder: (context, isExpanded) {
                            return const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "  Countries",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          },
                          body: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              country.length,
                              (i) => ListTile(
                                onTap: () {
                                  Navigator.of(context).pushNamed('homepage',
                                      arguments: country[i]);
                                },
                                leading: const Icon(
                                  Icons.language_sharp,
                                  color: Colors.white,
                                ),
                                title: Text(
                                  country[i],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          isExpanded: isActive,
                          canTapOnHeader: true,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
