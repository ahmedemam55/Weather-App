import 'package:flutter/material.dart';
import 'package:graduation_project/features/layout_view.dart';
import 'package:graduation_project/features/settings_provider.dart';
import 'package:graduation_project/features/weather_view/widgets/scroll_list.dart';
import 'package:graduation_project/models/weather_model.dart';
import 'package:provider/provider.dart';

class WeatherView extends StatefulWidget {
  static const String routeName = "WeatherView";

  WeatherView({super.key});

  @override
  State<WeatherView> createState() => WeatherViewState();
}

class WeatherViewState extends State<WeatherView> {
  WeatherModel? weatherData;

  void updataui() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var weatherData = Provider.of<SettingsProvider>(context).weatherData;
    var vm = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: weatherData == null
          ?  LayoutView()
          : Scaffold(
              appBar: AppBar(
                toolbarHeight: 30,
                iconTheme: IconThemeData(
                    color: vm.isDark() ? Colors.white : Color(0xFF5D9CEC)),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Icon(
                            Icons.location_on_outlined,
                            size: 30,
                            color: theme.primaryColor,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '${weatherData!.cityName},',
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: vm.isDark() ? Colors.white : Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Text(
                                weatherData!.country,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  color: vm.isDark()
                                      ? Colors.white.withOpacity(0.6)
                                      : Colors.black.withOpacity(0.7),
                                  fontSize: 23,
                                  fontWeight: FontWeight.w300,
                                  overflow: TextOverflow.ellipsis,

                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Text(
                      "Today's Report",
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: vm.isDark() ? Colors.white : Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 300,
                            child: Image(
                              image: AssetImage(weatherData!.getImage()),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            'Its ${weatherData!.weatherCondition}',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: vm.isDark() ? Colors.white : Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${weatherData!.temp.toInt().toString()}",
                                    style: TextStyle(
                                      fontSize: 80,
                                      fontWeight: FontWeight.w600,
                                      color: vm.isDark()
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 60),
                                    child: Text(
                                      "°C",
                                      style:
                                          theme.textTheme.titleLarge!.copyWith(
                                        color: theme.primaryColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Tmax : ${weatherData!.maxTemp.toInt()}',
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                          color: vm.isDark()
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 13),
                                        child: Text(
                                          "°C",
                                          style: theme.textTheme.titleLarge!
                                              .copyWith(
                                            color: theme.primaryColor,
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Tmin : ${weatherData!.minTemp.toInt()}',
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                          color: vm.isDark()
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 13),
                                        child: Text(
                                          "°C",
                                          style: theme.textTheme.titleLarge!
                                              .copyWith(
                                            color: theme.primaryColor,
                                            fontSize: 9,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.watch_later_outlined,
                                  size: 20,
                                  color: theme.primaryColor,
                                ),
                              ),
                              Text(
                                "Hourly Foreecast",
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  color:
                                      vm.isDark() ? Colors.white : Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ScrollList(
                                  hour: "12 AM",
                                  image: weatherData!.getImage0(),
                                  temp: weatherData!.temp0.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "1 AM",
                                  image: weatherData!.getImage1(),
                                  temp: weatherData!.temp1.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "2 AM",
                                  image: weatherData!.getImage2(),
                                  temp: weatherData!.temp2.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "3 AM",
                                  image: weatherData!.getImage3(),
                                  temp: weatherData!.temp3.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "4 AM",
                                  image: weatherData!.getImage4(),
                                  temp: weatherData!.temp4.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "5 AM",
                                  image: weatherData!.getImage5(),
                                  temp: weatherData!.temp5.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "6 AM",
                                  image: weatherData!.getImage6(),
                                  temp: weatherData!.temp6.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "7 AM",
                                  image: weatherData!.getImage7(),
                                  temp: weatherData!.temp7.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "8 AM",
                                  image: weatherData!.getImage8(),
                                  temp: weatherData!.temp8.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "9 AM",
                                  image: weatherData!.getImage9(),
                                  temp: weatherData!.temp9.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "10 AM",
                                  image: weatherData!.getImage10(),
                                  temp: weatherData!.temp10.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "11 AM",
                                  image: weatherData!.getImage11(),
                                  temp: weatherData!.temp11.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "12 PM",
                                  image: weatherData!.getImage12(),
                                  temp: weatherData!.temp12.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "1 PM",
                                  image: weatherData!.getImage13(),
                                  temp: weatherData!.temp13.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "2 PM",
                                  image: weatherData!.getImage14(),
                                  temp: weatherData!.temp14.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "3 PM",
                                  image: weatherData!.getImage15(),
                                  temp: weatherData!.temp15.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "4 PM",
                                  image: weatherData!.getImage16(),
                                  temp: weatherData!.temp16.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "5 PM",
                                  image: weatherData!.getImage17(),
                                  temp: weatherData!.temp17.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "6 PM",
                                  image: weatherData!.getImage18(),
                                  temp: weatherData!.temp18.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "7 PM",
                                  image: weatherData!.getImage19(),
                                  temp: weatherData!.temp19.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "8 PM",
                                  image: weatherData!.getImage20(),
                                  temp: weatherData!.temp20.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "9 PM",
                                  image: weatherData!.getImage21(),
                                  temp: weatherData!.temp21.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "10 PM",
                                  image: weatherData!.getImage22(),
                                  temp: weatherData!.temp22.toInt().toString(),
                                ),
                                ScrollList(
                                  hour: "11 PM",
                                  image: weatherData!.getImage23(),
                                  temp: weatherData!.temp23.toInt().toString(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
    );
  }
}
