import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graduation_project/services/snackers_service.dart';

class firebaseUtils {
  Future<bool> createUserAccount(String emailAddress, String password) async {
    try {
      EasyLoading.show(status: 'Creating account...');
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      print(credential.user?.email);
      EasyLoading.dismiss(); // Dismiss on success
      return true;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss(); // Dismiss on error
      if (e.code == 'weak-password') {
        SnackBarService.showErrorMessage("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        SnackBarService.showErrorMessage("The account already exists for that email.");
      } else {
        SnackBarService.showErrorMessage(e.message ?? "An error occurred");
      }
      return false;
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
      return false;
    }
  }

  Future<bool> loginUserAccount(String emailAddress, String password) async {
    try {
      EasyLoading.show(status: 'Logging in...');
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      print(credential.user?.uid);
      EasyLoading.dismiss(); // Dismiss on success
      return true;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss(); // Dismiss on error
      if (e.code == 'user-not-found' || e.code == 'user-not-found') {
        SnackBarService.showErrorMessage("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        SnackBarService.showErrorMessage("Wrong password provided.");
      } else if (e.code == 'invalid-credential') {
        SnackBarService.showErrorMessage("Invalid email or password.");
      } else {
        SnackBarService.showErrorMessage(e.message ?? "Authentication failed");
      }
      return false;
    } catch (e) {
      EasyLoading.dismiss();
      print(e);
      return false;
    }
  }
}
