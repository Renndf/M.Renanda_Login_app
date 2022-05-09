import 'package:flutter/material.dart';
import 'package:login_app/Screens/welcome_page.dart';
import 'package:login_app/UserData.dart';
import 'package:login_app/widgets/CustomButton.dart';
import 'package:login_app/widgets/DialogBox.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? name = UserData.listEmail[UserData.index];
  bool isOverflow() {
    if (name!.length > 26) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WillPopScope(
            onWillPop: () async {
              final exit = await DialogBox.showWarning(context);
              return exit ?? false;
            },
            child: Scaffold(
              body: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 13.h,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundImage: const AssetImage("images/pp.png"),
                          backgroundColor: Colors.white,
                          radius: 45.sp,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: 75.w,
                          child: (isOverflow())
                              ? Row(
                                  children: [
                                    Expanded(
                                      child: SingleChildScrollView(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 1.h),
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          "$name",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Center(
                                  child: Text(
                                    "$name",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "Junior",
                          style:
                              TextStyle(color: Colors.black45, fontSize: 12.sp),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        elevation: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          height: 15.h,
                          child: Row(
                            children: [
                              Icon(
                                Icons.date_range,
                                size: 30.sp,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Joined Date",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    "20 September 2022  ",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 11.sp),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        elevation: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          height: 15.h,
                          child: Row(
                            children: [
                              Icon(
                                Icons.description_outlined,
                                size: 30.sp,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Attempted Quiz",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    "10",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 11.sp),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        elevation: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          height: 15.h,
                          child: Row(
                            children: [
                              Icon(
                                Icons.beenhere_outlined,
                                size: 30.sp,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Completed Quiz",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    "36",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 11.sp),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 4.h, horizontal: 10.w),
                          child: CustomButton(
                            child: Text(
                              "Log Out",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            onPressed: () async {
                              final logout =
                                  await DialogBox.showLogOut(context);
                              if (logout == true) {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/main', (Route<dynamic> route) => false);
                              }
                              ;
                            },
                          )),
                    ],
                  )
                ],
              ),
            )),
      );
    });
  }
}
