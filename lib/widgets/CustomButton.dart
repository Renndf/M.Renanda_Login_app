import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.onPressed,
    required this.child,
    this.color = const Color.fromARGB(255, 23, 174, 43),
    Key? key,
  }) : super(key: key);

  void Function()? onPressed;
  Widget child = Text(
    "",
    style: TextStyle(fontSize: 15.sp),
  );
  Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            minimumSize: Size(0, 7.h)),
        child: Center(child: child));
  }
}
