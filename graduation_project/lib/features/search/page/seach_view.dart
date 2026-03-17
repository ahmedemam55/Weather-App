import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graduation_project/features/settings_provider.dart';
import 'package:graduation_project/features/weather_view/pages/weather_view.dart';
import 'package:graduation_project/models/weather_model.dart';
import 'package:graduation_project/services/weather_service.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  static const String routeName = "SearchView";

  String? cityName;

  SearchView({super.key, this.updateui});

  final VoidCallback? updateui;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              width: mediaQuery.width,
              height: mediaQuery.height * 0.10,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              child: Text(
                "Around Your Country",
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.primaryColor,
                  fontSize: 27,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                elevation: 6.0,
                shadowColor: theme.primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
                child: TextField(
                  onChanged: (data) {
                    cityName = data;
                  },
                  onSubmitted: (data) async {
                    if (data.trim().isEmpty) return;
                    
                    // Hide keyboard
                    FocusScope.of(context).unfocus();
                    
                    cityName = data;
                    
                    // Show Loading
                    EasyLoading.show(
                      status: 'Finding $data...',
                      maskType: EasyLoadingMaskType.black,
                    );
                    
                    try {
                      WeatherServices services = WeatherServices();
                      WeatherModel? weather = await services.getwheather(cityname: cityName!);
                      
                      if (weather != null) {
                        var provider = Provider.of<SettingsProvider>(context, listen: false);
                        provider.weatherData = weather;
                        provider.cityName = cityName;
                        
                        // Small delay to make it look smooth
                        await Future.delayed(const Duration(milliseconds: 500));
                        EasyLoading.dismiss();
                        
                        Navigator.pushNamed(context, WeatherView.routeName);
                      } else {
                        EasyLoading.dismiss();
                      }
                    } catch (e) {
                      EasyLoading.dismiss();
                      print(e);
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                    hintText: "Search for a city",
                    hintStyle: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: theme.primaryColor.withOpacity(0.6),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: theme.primaryColor,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: theme.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
