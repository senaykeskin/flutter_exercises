import 'package:flutter/material.dart';
import 'package:flutter_exercises/global/constants.dart';
import 'package:flutter_exercises/screen_ui/weather/weather_model.dart';
import 'package:flutter_exercises/screen_ui/weather/weather_service.dart';

class WeatherHomeScreen extends StatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  State<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  WeatherModel? _weather;

  void _getWeatherData() async {
    try {
      WeatherModel weather = await WeatherService().getWeatherData();
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      debugPrint("Hata: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    final resultList = _weather?.result ?? [];
    final String city = _weather?.city ?? "";
    final String capitalizedCity = city.isNotEmpty
        ? city.replaceFirst(city[0], city[0].toUpperCase())
        : "";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade300,
        title: Text(capitalizedCity, style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: _weather == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: resultList.length,
              itemBuilder: (context, index) {
                final dayWeather = resultList[index];
                return Container(
                    margin: horizontal10 + vertical5,
                    padding: all10,
                    child: Row(
                      children: [
                        SizedBox(
                          width: W(context) * 0.22,
                          child: Text(
                            dayWeather.day ?? "",
                            style: TextStyle(
                                fontSize: W(context) / 26, color: Colors.black),
                          ),
                        ),
                        SizedBox(width: 20),
                        if (dayWeather.icon != null &&
                            dayWeather.icon!.isNotEmpty)
                          Image.network(
                            dayWeather.icon!,
                            width: 40,
                            height: 40,
                            fit: BoxFit.fill,
                          ),
                        SizedBox(width: 10),
                        SizedBox(
                          width: W(context) * 0.17,
                          child: Text(
                              dayWeather.degree != null
                                  ? "${dayWeather.degree}\u00B0"
                                  : "",
                              style: TextStyle(
                                  fontSize: W(context) / 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                            width: W(context) * 0.3,
                            child: Text(
                              dayWeather.description ?? "",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: W(context) / 28,
                                  color: Colors.grey.shade700),
                            ))
                      ],
                    ));
              },
            ),
    );
  }
}
