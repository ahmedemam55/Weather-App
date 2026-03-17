import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SnackBarService {
  static void showSuccessMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: msg.length > 80 ? 100 : 75,
            padding: const EdgeInsets.only(right: 8),
            margin: const EdgeInsets.only(right: 24, left: 24),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
                    children: [
                      Container(
                        height: double.infinity,
                        width: 10,
                        decoration: const BoxDecoration(
                            color: Color(0xFF46c234),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Lottie.asset(
                          "assets/icons/success.json",
                          repeat: false,
                          height: 250,
                          width: 250,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Success",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              msg,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontFamily: "Poppins",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
      duration: const Duration(
        seconds: 5,
      ),
      dismissDirections: [DismissDirection.endToStart],
    );
  }

  static void showErrorMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: msg.length > 80 ? 100 : 75,
            padding: const EdgeInsets.only(right: 8),
            margin: const EdgeInsets.only(right: 24, left: 24),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 10,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Lottie.asset(
                    "assets/icons/failed-mail.json",
                    repeat: false,
                    height: 250,
                    width: 250,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Error",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        msg,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontFamily: "Poppins",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      duration: const Duration(
        seconds: 5,
      ),
      dismissDirections: [DismissDirection.endToStart],
    );
  }

}
