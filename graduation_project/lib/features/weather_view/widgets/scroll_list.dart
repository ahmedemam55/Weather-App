import 'package:flutter/material.dart';
import 'package:graduation_project/features/settings_provider.dart';
import 'package:provider/provider.dart';

class ScrollList extends StatelessWidget {
  final String? image;
  final String? temp;
  final String? hour;

  const ScrollList({
    super.key,
    required this.image,
    required this.temp,
    required this.hour,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: Container(
        decoration: BoxDecoration(
            color: theme.primaryColor, borderRadius: BorderRadius.circular(25)),
        height: 150,
        width: 90,
        child: Column(
          children: [
            Container(
              width: 60,
              child: Image(
                image: AssetImage(image!),
                fit: BoxFit.cover,
              ),
            ),
            Spacer(),
            Text(
              hour!,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: vm.isDark() ? Colors.white : Colors.black),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  temp!,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: vm.isDark() ? Colors.white : Colors.black,
                    fontSize: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    "°",
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: vm.isDark() ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
