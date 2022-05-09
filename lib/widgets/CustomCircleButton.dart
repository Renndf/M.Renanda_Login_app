import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SimpleCircularIconButton extends StatelessWidget {
  const SimpleCircularIconButton(
      {required this.name,
      this.iconColor = const Color.fromARGB(97, 250, 250, 250),
      this.outlineColor = Colors.transparent,
      this.notificationFillColor = Colors.red,
      this.notificationCount,
      this.radius = 48.0,
      Key? key})
      : super(key: key);

  final String name;
  final Color outlineColor;
  final Color iconColor;
  final Color notificationFillColor;
  final int? notificationCount;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Ink(
          width: radius,
          height: radius,
          decoration: ShapeDecoration(
            color: Color.fromARGB(206, 238, 238, 238),
            shape: CircleBorder(side: BorderSide(color: outlineColor)),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            splashRadius: radius / 2,
            iconSize: radius / 2,
            icon: Image.asset(name, width: 25.sp, height: 25.sp),
            splashColor: iconColor.withOpacity(.4),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("No Connection",
                            style: TextStyle(fontSize: 17.sp)),
                        content: Text(
                          "Please check your internet connection.",
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child:
                                  Text("OK", style: TextStyle(fontSize: 12.sp)))
                        ],
                      ));
            },
          ),
        ),
        if (notificationCount != null) ...[
          Positioned(
            top: radius / -14,
            right: radius / -14,
            child: Container(
              width: radius / 2.2,
              height: radius / 2.2,
              decoration: ShapeDecoration(
                color: notificationFillColor,
                shape: const CircleBorder(),
              ),
              child: Center(
                child: Text(
                  notificationCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: radius / 4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
