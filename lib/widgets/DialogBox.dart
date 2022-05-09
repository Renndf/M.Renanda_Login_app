import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:login_app/widgets/CustomButton.dart';

class DialogBox {
  static Future<dynamic> dialogBoxError(BuildContext context, String text) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Image(
                image: const AssetImage("images/error.png"),
                height: 18.h,
                width: 18.w,
              ),
              content: Container(
                height: 10.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "ERROR",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(text, textAlign: TextAlign.center)
                  ],
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.fromLTRB(5.sp, 0, 5.sp, 15.sp),
                  child: CustomButton(
                    child: Text(
                      "Try again",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: const Color.fromARGB(255, 216, 21, 21),
                  ),
                )
              ],
            ));
  }

  static Future<dynamic> dialogBoxSuccess(
      BuildContext context, String text, Function()? onPressed) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Image(
                image: const AssetImage("images/success.png"),
                height: 18.h,
                width: 18.w,
              ),
              content: Container(
                height: 10.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Success",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.fromLTRB(5.sp, 0, 5.sp, 15.sp),
                  child: CustomButton(
                    child: Text(
                      "OK",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    onPressed: onPressed,
                    color: const Color.fromARGB(255, 18, 158, 37),
                  ),
                )
              ],
            ));
  }

  static Future<bool?> showWarning(BuildContext context) async {
    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Do you want to exit app?",
                style: TextStyle(fontSize: 15.sp),
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(
                      "No",
                      style: TextStyle(fontSize: 12.sp),
                    )),
                TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text("Yes", style: TextStyle(fontSize: 12.sp))),
              ],
            ));
  }

  static Future<bool?> showLogOut(BuildContext context) async {
    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Do you want to Log Out?",
                style: TextStyle(fontSize: 15.sp),
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(
                      "No",
                      style: TextStyle(fontSize: 12.sp),
                    )),
                TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text("Yes", style: TextStyle(fontSize: 12.sp))),
              ],
            ));
  }
}
