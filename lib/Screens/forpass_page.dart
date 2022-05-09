import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:login_app/widgets/CustomForm.dart';
import 'package:login_app/widgets/CustomButton.dart';
import '../UserData.dart';

class ForpassPage extends StatefulWidget {
  ForpassPage({Key? key}) : super(key: key);

  @override
  State<ForpassPage> createState() => _ForpassPageState();
}

class _ForpassPageState extends State<ForpassPage> {
  bool valid = false;
  bool loading = false;
  var email;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          }, // Menghilangkan focus saat layar ditekan
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.black87,
                  onPressed: Navigator.of(context).pop,
                ),
                backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                elevation: 0,
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    children: [
                      Container(
                        height: 20.h,
                        width: 28.h,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("images/pesan.png"))),
                      ),
                      SizedBox(
                        height: 02.h,
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            "Forgot Your Password?",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 03.h,
                      ),
                      Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              Text(
                                "Confirm your email address below to reset password :",
                                style: TextStyle(fontSize: 12.sp),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 02.h,
                              ),
                              Align(
                                child: Center(
                                  child: CustomForm(
                                    submit: (_) async {
                                      setState(() => loading = true);
                                      await Future.delayed(
                                          const Duration(seconds: 3));
                                      setState(() => loading = false);
                                      UserData.checkEmail(context,
                                          email: email,
                                          valid: valid,
                                          text:
                                              "Your email is exist. Please reset your password");
                                    },
                                    textInputAction: TextInputAction.done,
                                    hintText: "Enter Your Email Address",
                                    type: TextInputType.emailAddress,
                                    validator: (value) {
                                      email = value;
                                      const pattern =
                                          r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                                      final regExp = RegExp(pattern);
                                      if (value!.isEmpty) {
                                        valid = false;
                                        return 'Insert your email address';
                                      } else if (!regExp.hasMatch(value)) {
                                        valid = false;
                                        return 'Enter a valid email';
                                      } else {
                                        valid = true;
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 02.h,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            child: CustomButton(
                              child: loading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "Confirm",
                                      style: TextStyle(fontSize: 15.sp),
                                    ),
                              onPressed: () async {
                                setState(() => loading = true);
                                await Future.delayed(
                                    const Duration(seconds: 3));
                                setState(() => loading = false);
                                UserData.checkEmail(context,
                                    email: email,
                                    valid: valid,
                                    text:
                                        "Your email is exist. Please reset your password");
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
