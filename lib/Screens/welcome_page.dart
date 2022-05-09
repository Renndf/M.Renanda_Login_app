import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:login_app/widgets/CustomButton.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// Plugin untuk aplikasi responsive
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Welcome Page',
            home: Scaffold(
              body: Stack(
                children: [
                  ListView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 35.w,
                            height: 35.h,
                            child:
                                const Image(image: AssetImage("images/us.png")),
                          ),
                          Center(
                            child: Text(
                              "Join Us",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 35.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 02.h,
                          ),
                          Center(
                            child: Text(
                              "Get started in the new adventure full of questions around the world",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15.sp),
                            ),
                          ),
                          SizedBox(
                            height: 07.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 3.h),
                            child: CustomButton(
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/login');
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 3.h),
                            child: CustomButton(
                              child: Text(
                                "Register",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/register');
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}
