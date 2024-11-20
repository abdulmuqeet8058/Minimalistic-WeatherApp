import 'package:flutter/material.dart';
import 'package:weather/weather/view.dart';

void main() {
  runApp(const MyApp());
}

/* It may show an exception while running the app 
   because geolocater is initialized in viewmodel class
   but still if exception came use F5 to continue
   it will run .

*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Live',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WeatherView(),
    );
  }
}
