import 'dart:convert';
import 'package:graduation_project/models/weather_model.dart';
import 'package:graduation_project/services/snackers_service.dart';
import 'package:http/http.dart' as http;


class WeatherServices {
  // Changed to https
  String baseUrl = 'https://api.weatherapi.com/v1';
  String apiKey = '55734393ba7148a9b3b221953233107';

  Future<WeatherModel?> getwheather({required String cityname}) async {
    WeatherModel? weather;
    try {
      Uri url =
      Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=${Uri.encodeComponent(cityname)}&days=7');
      
      print('Fetching weather for: $cityname');
      http.Response response = await http.get(url);
      print('Response Status: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        weather = WeatherModel.fromJson(data);
        print('Weather data parsed successfully for: ${weather.cityName}');
      } else {
        print('Error Response Body: ${response.body}');
        SnackBarService.showErrorMessage("Could not find weather for $cityname.");
      }
    } catch (e) {
      print('Exception during fetch: $e');
      SnackBarService.showErrorMessage("Error: Check your internet or city name.");
    }
    return weather;
  }
}
