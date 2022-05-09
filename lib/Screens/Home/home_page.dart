import 'package:flutter/material.dart';
import 'package:login_app/UserData.dart';
import 'package:sizer/sizer.dart';
import 'package:login_app/widgets/CustomGridView.dart';
import 'package:login_app/widgets/DialogBox.dart';

import 'profile_page.dart';
import 'item_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "HomePage",
        home: WillPopScope(
          onWillPop: () async {
            final exit = await DialogBox.showWarning(context);
            return exit ?? false;
          },
          child: Scaffold(
              body: ListView(physics: BouncingScrollPhysics(), children: [
            Container(
              margin: EdgeInsets.only(left: 5.w, right: 5.w),
              height: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Feed",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notification_add),
                    iconSize: 20.sp,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 91, 232, 147),
                        borderRadius: BorderRadius.circular(20)),
                    height: 25.h,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Popular quiz this week",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Most popular by search",
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.black38),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(height: 35.h, child: Custom_GridView()),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New Quiz today",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Find your new favorite item",
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.black38),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(height: 35.h, child: Custom_GridView())
                ],
              ),
            ),
          ])),
        ),
      );
    });
  }
}
