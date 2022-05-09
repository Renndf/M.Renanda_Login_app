import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Custom_GridView extends StatefulWidget {
  Custom_GridView({Key? key}) : super(key: key);

  @override
  State<Custom_GridView> createState() => _Custom_GridViewState();
}

class _Custom_GridViewState extends State<Custom_GridView> {
  double? button1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      crossAxisCount: 3,
      mainAxisSpacing: 0,
      primary: false,
      crossAxisSpacing: 2,
      children: [
        InkWell(
          splashColor: Colors.white,
          onHover: (a) {
            setState(() {
              button1 = 5;
            });
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: button1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: AssetImage("images/grid/1.png")),
                Text(
                  "Personal",
                  style: TextStyle(fontSize: 12.sp),
                )
              ],
            ),
          ),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage("images/grid/2.png")),
              Text("Chart", style: TextStyle(fontSize: 12.sp))
            ],
          ),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage("images/grid/3.png")),
              Text("Message", style: TextStyle(fontSize: 12.sp))
            ],
          ),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage("images/grid/4.png")),
              Text("Protection", style: TextStyle(fontSize: 12.sp))
            ],
          ),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage("images/grid/5.png")),
              Text("Searching", style: TextStyle(fontSize: 12.sp))
            ],
          ),
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage("images/grid/6.png")),
              Text("Verification", style: TextStyle(fontSize: 12.sp))
            ],
          ),
        ),
      ],
    ));
  }
}
