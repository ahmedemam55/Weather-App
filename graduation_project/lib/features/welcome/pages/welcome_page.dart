import 'package:flutter/material.dart';
import 'package:graduation_project/features/login/pages/login_view.dart';
import 'package:graduation_project/features/register/pages/register_view.dart';
import 'package:graduation_project/features/settings_provider.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget {
  static const String routeName = "welcomePage";

  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);
    return Scaffold(
      backgroundColor: vm.isDark() ? Colors.black : theme.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150, left: 40),
                  child: Image.asset(
                    'assets/images/cloud.png',
                    width: 400,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 325, right: 10),
                  child: Image.asset(
                    'assets/images/lightning.png',
                    width: 150,
                    height: 80,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 340, right: 110),
                  child: Image.asset(
                    'assets/images/water.png',
                    height: 40,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 340, left: 90),
                  child: Image.asset(
                    'assets/images/water.png',
                    height: 40,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Discover the Weather',
            style: theme.textTheme.titleLarge!.copyWith(
                color: vm.isDark() ? Colors.white : Colors.yellow,
                fontSize: 30),
          ),
          Text(
            'in Your City',
            style: theme.textTheme.titleLarge!.copyWith(
                color: vm.isDark() ? Colors.white : Colors.yellow,
                fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Get to Know your weather mapt and ',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: vm.isDark() ? Colors.white : Colors.yellow,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 90,
            ),
            child: Text(
              'odor precpitation fcrecost',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: vm.isDark() ? Colors.white : Colors.yellow,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  RegisterView.routeName,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    vm.isDark() ? theme.primaryColor : Color(0xFF060E1E),
                fixedSize: Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Get started",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: vm.isDark() ? Colors.white : theme.primaryColor,
                    fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Text(
                    'Already have an acount?',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                      color: vm.isDark() ? Colors.white : Colors.yellow,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      LoginView.routeName,
                    );
                  },
                  child: Text(
                    'Login',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 16,
                        color: vm.isDark()
                            ? theme.primaryColor
                            : Color(0xFF060E1E)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
