import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/weather/viewmodel.dart';

class WeatherView extends StatefulWidget {
  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  WeatherViewModel model = Get.put(WeatherViewModel());
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    try {
      model.GetWeather();
    } catch (e) {
      print("Error during initState: $e");
    }
  }

  Future<void> _refresh() async {
    return await model.GetWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          "Weather Live",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Obx(
          () {
            if (model.model.isEmpty) {
              return Center(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ), // Show a loader until data is fetched.
                ),
              );
            } else {
              var weatherdata = model.model.first;
              return SingleChildScrollView(
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.blue),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Current temperature:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 10),
                              Text(
                                weatherdata.currentTemperature.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.yellow),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Weather description:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 10),
                              Text(
                                weatherdata.weatherDescription,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.green),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Humidity level:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Text(
                                weatherdata.humidityLevel.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
