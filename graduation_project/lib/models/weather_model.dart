class WeatherModel {
  final String cityName;
  final String country;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final double temp0;
  final double temp1;
  final double temp2;
  final double temp3;
  final double temp4;
  final double temp5;
  final double temp6;
  final double temp7;
  final double temp8;
  final double temp9;
  final double temp10;
  final double temp11;
  final double temp12;
  final double temp13;
  final double temp14;
  final double temp15;
  final double temp16;
  final double temp17;
  final double temp18;
  final double temp19;
  final double temp20;
  final double temp21;
  final double temp22;
  final double temp23;
  final String weather0;
  final String weather1;
  final String weather2;
  final String weather3;
  final String weather4;
  final String weather5;
  final String weather6;
  final String weather7;
  final String weather8;
  final String weather9;
  final String weather10;
  final String weather11;
  final String weather12;
  final String weather13;
  final String weather14;
  final String weather15;
  final String weather16;
  final String weather17;
  final String weather18;
  final String weather19;
  final String weather20;
  final String weather21;
  final String weather22;
  final String weather23;

  WeatherModel(
      {required this.weather0,
      required this.weather1,
      required this.weather2,
      required this.weather3,
      required this.weather4,
      required this.weather5,
      required this.weather6,
      required this.weather7,
      required this.weather8,
      required this.weather9,
      required this.weather10,
      required this.weather11,
      required this.weather12,
      required this.weather13,
      required this.weather14,
      required this.weather15,
      required this.weather16,
      required this.weather17,
      required this.weather18,
      required this.weather19,
      required this.weather20,
      required this.weather21,
      required this.weather22,
      required this.weather23,
      required this.temp0,
      required this.temp1,
      required this.temp2,
      required this.temp3,
      required this.temp4,
      required this.temp5,
      required this.temp6,
      required this.temp7,
      required this.temp8,
      required this.temp9,
      required this.temp10,
      required this.temp11,
      required this.temp12,
      required this.temp13,
      required this.temp14,
      required this.temp15,
      required this.temp16,
      required this.temp17,
      required this.temp18,
      required this.temp19,
      required this.temp20,
      required this.temp21,
      required this.temp22,
      required this.temp23,
      required this.cityName,
      required this.country,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    var forecastDay = json['forecast']['forecastday'][0]; // Use index 0 for today
    var hours = forecastDay['hour'];
    
    return WeatherModel(
      weather0: hours[0]['condition']['text'],
      weather1: hours[1]['condition']['text'],
      weather2: hours[2]['condition']['text'],
      weather3: hours[3]['condition']['text'],
      weather4: hours[4]['condition']['text'],
      weather5: hours[5]['condition']['text'],
      weather6: hours[6]['condition']['text'],
      weather7: hours[7]['condition']['text'],
      weather8: hours[8]['condition']['text'],
      weather9: hours[9]['condition']['text'],
      weather10: hours[10]['condition']['text'],
      weather11: hours[11]['condition']['text'],
      weather12: hours[12]['condition']['text'],
      weather13: hours[13]['condition']['text'],
      weather14: hours[14]['condition']['text'],
      weather15: hours[15]['condition']['text'],
      weather16: hours[16]['condition']['text'],
      weather17: hours[17]['condition']['text'],
      weather18: hours[18]['condition']['text'],
      weather19: hours[19]['condition']['text'],
      weather20: hours[20]['condition']['text'],
      weather21: hours[21]['condition']['text'],
      weather22: hours[22]['condition']['text'],
      weather23: hours[23]['condition']['text'],
      temp0: (hours[0]['temp_c'] as num).toDouble(),
      temp1: (hours[1]['temp_c'] as num).toDouble(),
      temp2: (hours[2]['temp_c'] as num).toDouble(),
      temp3: (hours[3]['temp_c'] as num).toDouble(),
      temp4: (hours[4]['temp_c'] as num).toDouble(),
      temp5: (hours[5]['temp_c'] as num).toDouble(),
      temp6: (hours[6]['temp_c'] as num).toDouble(),
      temp7: (hours[7]['temp_c'] as num).toDouble(),
      temp8: (hours[8]['temp_c'] as num).toDouble(),
      temp9: (hours[9]['temp_c'] as num).toDouble(),
      temp10: (hours[10]['temp_c'] as num).toDouble(),
      temp11: (hours[11]['temp_c'] as num).toDouble(),
      temp12: (hours[12]['temp_c'] as num).toDouble(),
      temp13: (hours[13]['temp_c'] as num).toDouble(),
      temp14: (hours[14]['temp_c'] as num).toDouble(),
      temp15: (hours[15]['temp_c'] as num).toDouble(),
      temp16: (hours[16]['temp_c'] as num).toDouble(),
      temp17: (hours[17]['temp_c'] as num).toDouble(),
      temp18: (hours[18]['temp_c'] as num).toDouble(),
      temp19: (hours[19]['temp_c'] as num).toDouble(),
      temp20: (hours[20]['temp_c'] as num).toDouble(),
      temp21: (hours[21]['temp_c'] as num).toDouble(),
      temp22: (hours[22]['temp_c'] as num).toDouble(),
      temp23: (hours[23]['temp_c'] as num).toDouble(),
      cityName: json['location']['name'],
      country: json['location']['country'],
      temp: (forecastDay['day']['avgtemp_c'] as num).toDouble(),
      maxTemp: (forecastDay['day']['maxtemp_c'] as num).toDouble(),
      minTemp: (forecastDay['day']['mintemp_c'] as num).toDouble(),
      weatherCondition: forecastDay['day']['condition']['text'],
    );
  }

  String getImage() => _getConditionImage(weatherCondition);
  String getImage0() => _getConditionImage(weather0);
  String getImage1() => _getConditionImage(weather1);
  String getImage2() => _getConditionImage(weather2);
  String getImage3() => _getConditionImage(weather3);
  String getImage4() => _getConditionImage(weather4);
  String getImage5() => _getConditionImage(weather5);
  String getImage6() => _getConditionImage(weather6);
  String getImage7() => _getConditionImage(weather7);
  String getImage8() => _getConditionImage(weather8);
  String getImage9() => _getConditionImage(weather9);
  String getImage10() => _getConditionImage(weather10);
  String getImage11() => _getConditionImage(weather11);
  String getImage12() => _getConditionImage(weather12);
  String getImage13() => _getConditionImage(weather13);
  String getImage14() => _getConditionImage(weather14);
  String getImage15() => _getConditionImage(weather15);
  String getImage16() => _getConditionImage(weather16);
  String getImage17() => _getConditionImage(weather17);
  String getImage18() => _getConditionImage(weather18);
  String getImage19() => _getConditionImage(weather19);
  String getImage20() => _getConditionImage(weather20);
  String getImage21() => _getConditionImage(weather21);
  String getImage22() => _getConditionImage(weather22);
  String getImage23() => _getConditionImage(weather23);

  String _getConditionImage(String condition) {
    if (condition == 'Clear' || condition == 'Sunny') {
      return 'assets/images/Sun.png';
    } else if (condition == 'Sleet' || condition == 'Hail') {
      return 'assets/images/Thunder.png';
    } else if (condition == 'Patchy rain possible' ||
        condition == 'Light Cloud' || 
        condition == 'Partly cloudy' || 
        condition == 'Cloudy' || 
        condition == 'Overcast') {
      return 'assets/images/sun clouds.png';
    } else if (condition.toLowerCase().contains('rain') ||
        condition == 'Showers' ||
        condition == 'Patchy rain nearby') {
      return 'assets/images/rain.png';
    } else if (condition.toLowerCase().contains('thunder')) {
      return 'assets/images/Thunder.png';
    } else {
      return 'assets/images/sun clouds.png';
    }
  }
}
