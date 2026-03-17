import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:graduation_project/features/settings_provider.dart';

class LayoutView extends StatelessWidget {
  static const String routeName = "layout";

  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);


    return Scaffold(
      extendBody: true,
      body: vm.screens[vm.currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: theme.primaryColor.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 20,
              offset: Offset(0, 3), // changes the shadow direction
            ),
          ],
        ),
        child: BottomAppBar(
          height: 90,
          notchMargin: 10,
          shape: const CircularNotchedRectangle(),
          child: BottomNavigationBar(
            currentIndex: vm.currentIndex,
            onTap: vm.changeIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.search_sharp),
                label: "Tasks",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
