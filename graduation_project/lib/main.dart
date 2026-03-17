import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graduation_project/features/search/page/seach_view.dart';
import 'package:graduation_project/features/welcome/pages/welcome_page.dart';
import 'package:graduation_project/services/loading_services.dart';
import 'package:provider/provider.dart';
import 'package:graduation_project/core/config/application_theme_manager.dart';
import 'package:graduation_project/features/layout_view.dart';
import 'package:graduation_project/features/login/pages/login_view.dart';
import 'package:graduation_project/features/register/pages/register_view.dart';
import 'package:graduation_project/features/settings_provider.dart';
import 'package:graduation_project/features/splash/pages/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/weather_view/pages/weather_view.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp(),
    ),
  );
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ApplicationThemeManager.lightThemeData,
      darkTheme: ApplicationThemeManager.darkThemeData,
      themeMode: vm.currentThemeMode,
      initialRoute: LayoutView.routeName, // Changed to SplashView
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        LoginView.routeName: (context) =>  LoginView(),
        RegisterView.routeName: (context) =>  RegisterView(),
        LayoutView.routeName: (context) => const LayoutView(),
        WeatherView.routeName:(context) => WeatherView(),
        SearchView.routeName:(context) => SearchView(),
        WelcomePage.routeName:(context) => const WelcomePage(),

      },
      navigatorObservers: [BotToastNavigatorObserver()],
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),

    );
  }
}
