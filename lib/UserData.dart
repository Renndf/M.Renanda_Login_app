import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:login_app/widgets/CustomButton.dart';
import 'package:login_app/widgets/DialogBox.dart';

class UserData {
  static List<String?> listEmail = ["a@a.a"];
  static List<String?> listPass = ["12345678"];
  static var index;

  static void saveData(BuildContext context,
      {String? email,
      String? password,
      bool? valid,
      String text = "Your email and password is successfully added"}) {
    if (valid == true) {
      UserData.listEmail.add(email);
      UserData.listPass.add(password);
      for (var i = 0; i < UserData.listEmail.length; i++) {
        if (email == UserData.listEmail[i]) {
          UserData.index = i;
          break;
        }
      }
      DialogBox.dialogBoxSuccess(context, text, () {
        Navigator.of(context, rootNavigator: true)
            .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
      });
    } else {
      DialogBox.dialogBoxError(context, "Your email and password is not valid");
    }
  }

  static void checkData(BuildContext context,
      {String? email, String? password, bool? valid, String text = ""}) {
    bool temp = false;
    if (valid == true) {
      for (var i = 0; i < UserData.listEmail.length; i++) {
        if (email == UserData.listEmail[i] &&
            password == UserData.listPass[i]) {
          UserData.index = i;
          DialogBox.dialogBoxSuccess(context, text, () {
            Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
                '/home', (Route<dynamic> route) => false);
          });
          temp = true;
          break;
        }
      }
      if (temp == false) {
        DialogBox.dialogBoxError(context, "Your email and password is wrong");
      }
    } else {
      DialogBox.dialogBoxError(context, "Your email and password is not valid");
    }
  }

  static void checkEmail(BuildContext context,
      {String? email,
      bool? valid,
      String text = "Your email is confirmed. Please reset your password"}) {
    bool temp = false;
    if (valid == true) {
      for (var i = 0; i < UserData.listEmail.length; i++) {
        if (email == UserData.listEmail[i]) {
          UserData.index = i;
          DialogBox.dialogBoxSuccess(context, text, () {
            Navigator.of(context, rootNavigator: true)
                .pushReplacementNamed('/reset');
          });
          temp = true;
          break;
        }
      }
      if (temp == false) {
        DialogBox.dialogBoxError(context, "Your email and password is wrong");
      }
    } else {
      DialogBox.dialogBoxError(context, "Your email and password is not valid");
    }
  }

  static void resetPass(BuildContext context,
      {String? password,
      bool? valid,
      String text = "Your password have been reset. Please login again"}) {
    if (valid == true) {
      listPass[index] = password;
      DialogBox.dialogBoxSuccess(context, text, () {
        Navigator.of(context, rootNavigator: true)
            .pushNamedAndRemoveUntil('/login', ModalRoute.withName('/welcome'));
      });
    } else {
      DialogBox.dialogBoxError(context, "Your email and password is not valid");
    }
  }
}
