import 'dart:convert';
import 'package:flutter_exercises/screen_ui/weather/apiKey.dart';
import 'package:flutter_exercises/screen_ui/weather/weather_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<String> _getLocation() async {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    // Kullanıcının konumu açık mı?
    if (!serviceEnabled) {
      return Future.error("Konum servisi kapalı");
    }

    // Kullanıcı konum izni vermiş mi?
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Konum izni vermelisiniz");
      }
    }

    final Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high)
    );

    final List<Placemark> placemark =
    await placemarkFromCoordinates(position.latitude, position.longitude);

    final String? city = placemark[0].administrativeArea;
    if (city == null) {
      return Future.error("Sorun oluştu");
    }
    return city;
  }

  Future<WeatherModel> getWeatherData() async {
    String city = await _getLocation();
    city = city.toLowerCase();

    final String url =
        "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=antalya";

    const Map<String, String> headers = {
      'authorization': apiKey,
      'content-type': 'application/json'
    };

    final Uri uri = Uri.parse(url);
    final response = await http.get(uri, headers: headers);

    if (response.statusCode != 200) {
      return Future.error("Bir sorun oluştu");
    }

    final Map<String, dynamic> jsonData = jsonDecode(response.body);
    WeatherModel weatherModel = WeatherModel.fromJson(jsonData);
    return weatherModel;
  }
}
