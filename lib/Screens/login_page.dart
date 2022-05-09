import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:login_app/widgets/CustomCircleButton.dart';
import 'package:login_app/widgets/CustomForm.dart';
import 'package:login_app/widgets/CustomButton.dart';
import '../UserData.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool valid = false;
  bool passHidden = true;
  var email;
  var password;
  bool loading = false;

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
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(5.h),
                child: AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.black87,
                    onPressed: Navigator.of(context).pop,
                  ),
                  backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                  elevation: 0,
                  centerTitle: true,
                  title: Text(
                    "Login",
                    style: TextStyle(color: Colors.black, fontSize: 18.sp),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: Column(
                      children: [
                        Container(
                          height: 30.h,
                          width: 40.h,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("images/login.png"))),
                        ),
                        SizedBox(
                          height: 02.h,
                        ),
                        Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Email Address",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700)),
                                SizedBox(
                                  height: 02.h,
                                ),
                                Align(
                                  child: Center(
                                    child: CustomForm(
                                      hintText: "Enter Your Email Address",
                                      textInputAction: TextInputAction.next,
                                      type: TextInputType.emailAddress,
                                      validator: (value) {
                                        email = value;
                                        const pattern =
                                            r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                                        final regExp = RegExp(pattern);
                                        if (value!.isEmpty) {
                                          valid = false;
                                          return 'Email is Required';
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
                          height: 3.h,
                        ),
                        Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Password",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(
                                height: 02.h,
                              ),
                              CustomForm(
                                hintText: "Enter Your Password",
                                textInputAction: TextInputAction.done,
                                submit: (_) async {
                                  setState(() => loading = true);
                                  await Future.delayed(
                                      const Duration(seconds: 3));
                                  setState(() => loading = false);
                                  UserData.checkData(context,
                                      email: email,
                                      password: password,
                                      valid: valid,
                                      text: "You are successfully Login");
                                },
                                type: TextInputType.visiblePassword,
                                //Validator untuk mengecek password
                                validator: (value) {
                                  password = value;
                                  if (value!.isEmpty) {
                                    valid = false;
                                    return 'Password is required';
                                  } else if (value.length < 8) {
                                    valid = false;
                                    return "Password must be at least 8 characters long";
                                  } else {
                                    valid = true;
                                    return null;
                                  }
                                },
                                obscureText: passHidden,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    passHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black54,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      passHidden = !passHidden;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                            height: 15.sp,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/forgot');
                                  },
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 234, 121, 9),
                                        fontSize: 11.sp),
                                  )),
                            )),
                        SizedBox(
                          height: 2.h,
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
                                            "Login",
                                            style: TextStyle(fontSize: 15.sp),
                                          ),
                                    onPressed: () async {
                                      setState(() => loading = true);
                                      await Future.delayed(
                                          const Duration(seconds: 3));
                                      setState(() => loading = false);
                                      UserData.checkData(context,
                                          email: email,
                                          password: password,
                                          valid: valid,
                                          text: "You are successfully Login");
                                    })),
                            Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: TextStyle(
                                      fontSize: 10.sp, color: Colors.black54),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushReplacementNamed('/register');
                                  },
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 22, 199, 46)),
                                  ),
                                )
                              ],
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(children: <Widget>[
                          const Expanded(
                              child: Divider(
                            color: Colors.black12,
                          )),
                          Text(
                            "   Or Login with   ",
                            style: TextStyle(
                                color: Colors.black38, fontSize: 10.sp),
                          ),
                          const Expanded(
                              child: Divider(
                            color: Colors.black12,
                          )),
                        ]),
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SimpleCircularIconButton(
                                  name: "images/google.png",
                                  radius: 35.sp,
                                ),
                                SimpleCircularIconButton(
                                  name: "images/Apple.png",
                                  radius: 35.sp,
                                ),
                                SimpleCircularIconButton(
                                  name: "images/fb.png",
                                  radius: 35.sp,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
