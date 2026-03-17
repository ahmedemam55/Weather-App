import 'package:flutter/material.dart';
import 'package:graduation_project/features/login/pages/login_view.dart';
import 'package:provider/provider.dart';
import 'package:graduation_project/features/settings_provider.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  final List<String> themeList = [
    "Dark",
    "Light",
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);

    return Column(
      children: [
        Container(
          width: mediaQuery.width,
          height: mediaQuery.height * 0.22,
          color: theme.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
          child: Text(
            "Settings ",
            style: theme.textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "Mode",
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 16,
                  color: vm.isDark() ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: CustomDropdown<String>(
                    closedHeaderPadding:
                        EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                    expandedHeaderPadding:
                        EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                    items: themeList,
                    initialItem: vm.isDark() ? "Dark" : "Light",
                    decoration: CustomDropdownDecoration(
                      closedBorderRadius: BorderRadius.zero,
                      expandedBorderRadius: BorderRadius.zero,
                      closedBorder: const Border(
                        bottom: BorderSide(color: Color(0xFF5D9CEC), width: 1),
                        top: BorderSide(color: Color(0xFF5D9CEC), width: 1),
                        left: BorderSide(color: Color(0xFF5D9CEC), width: 1),
                        right: BorderSide(color: Color(0xFF5D9CEC), width: 1),
                      ),
                      expandedBorder: const Border(
                        bottom: BorderSide(color: Color(0xFF5D9CEC), width: 1),
                        top: BorderSide(color: Color(0xFF5D9CEC), width: 1),
                        left: BorderSide(color: Color(0xFF5D9CEC), width: 1),
                        right: BorderSide(color: Color(0xFF5D9CEC), width: 1),
                      ),
                      headerStyle: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF5D9CEC),
                      ),
                      listItemStyle: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF5D9CEC),
                      ),
                      closedSuffixIcon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF5D9CEC),
                        size: 22,
                      ),
                      expandedSuffixIcon: const Icon(
                        Icons.keyboard_arrow_up_rounded,
                        color: Color(0xFF5D9CEC),
                        size: 22,
                      ),
                      closedFillColor:
                          vm.isDark() ? Color(0xFF141922) : Colors.white,
                      expandedFillColor:
                          vm.isDark() ? Color(0xFF141922) : Colors.white,
                    ),
                    onChanged: (value) {
                      if (value == "Dark") {
                        vm.changeTheme(ThemeMode.dark);
                      } else if (value == "Light") {
                        vm.changeTheme(ThemeMode.light);
                      }
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 8.0),
                    backgroundColor: theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      LoginView.routeName,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Log out",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
