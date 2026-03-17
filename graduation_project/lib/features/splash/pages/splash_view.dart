import 'dart:async';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/welcome/pages/welcome_page.dart';
import 'package:provider/provider.dart';
import 'package:graduation_project/features/settings_provider.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "splash"; // Changed from "/" to "splash" to be clearer

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        if (mounted) { // Check if the widget is still in the tree
          Navigator.pushReplacementNamed(
            context,
            WelcomePage.routeName,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var vm = Provider.of<SettingsProvider>(context);

    return Scaffold(
      body: Image.asset(
        vm.isDark()
            ? "assets/images/splach_dark.png"
            : "assets/images/splash_light.png",
        height: mediaQuery.height,
        width: mediaQuery.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
