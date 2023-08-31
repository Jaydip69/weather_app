import 'package:flutter/material.dart';
import 'package:wether_app/services/data_service.dart';
import 'package:wether_app/model_class/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent.shade200,
            centerTitle: true,
            title: const Text(
              'Weather App',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ic_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 50,
                    width: 310,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent.shade400,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(7),
                      ),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/ic_box.png'),
                          fit: BoxFit.cover),
                    ),
                    child: TextField(
                        cursorColor: Colors.white,
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: _cityTextController,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          //prefixIcon: Icon(Icons.location_on_outlined,color: Colors.white),
                          hintText: "Enter City",
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 430,
                    width: 310,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent.shade400,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/ic_box.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        if (_response != null)
                          Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _cityTextController.text,
                                      style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(_response!.iconUrl),
                                    Text(
                                      '${((_response!.tempInfo.temperature - 32) * 5 / 9).toStringAsFixed(0)}°',
                                      style: const TextStyle(
                                          fontSize: 45,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _response!.weatherInfo.description,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 100,
                                          //color: Colors.white,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/ic_box.png'),
                                                  fit: BoxFit.cover)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "MIN TEMP",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                              const Divider(
                                                color: Colors.white60,
                                                thickness: 2,
                                                indent: 5,
                                                endIndent: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${((_response!.tempInfo.minTemp - 32) * 5 / 9).toStringAsFixed(0)}°',
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 100,
                                          //color: Colors.white,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/ic_box.png'),
                                                  fit: BoxFit.cover)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text("MAX TEMP",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15)),
                                                ],
                                              ),
                                              const Divider(
                                                color: Colors.white60,
                                                thickness: 2,
                                                indent: 5,
                                                endIndent: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${((_response!.tempInfo.maxTemp - 32) * 5 / 9).toStringAsFixed(0)}°',
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.deepPurpleAccent.shade200,
                      ),
                    ),
                    onPressed: _search,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.5, horizontal: 92),
                      child: Text('Search',
                          style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}
