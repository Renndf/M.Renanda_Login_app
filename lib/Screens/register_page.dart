import 'package:flutter/material.dart';
import 'package:login_app/UserData.dart';
import 'package:sizer/sizer.dart';
import 'package:login_app/widgets/CustomCircleButton.dart';
import 'package:login_app/widgets/CustomButton.dart';
import 'package:login_app/widgets/CustomForm.dart';
import '../UserData.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passHidden1 = true;
  bool passHidden2 = true;
  bool valid = false;
  bool loading = false;
  static var email;
  static var password;

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
                    "Register",
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
                                image: AssetImage("images/welcome.png"))),
                      ),
                      SizedBox(
                        height: 02.h,
                      ),
                      Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                    textInputAction: TextInputAction.next,
                                    hintText: "Enter Your Email Address",
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
                              textInputAction: TextInputAction.next,
                              hintText: "Enter Your Password",
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
                              obscureText: passHidden1,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  passHidden1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black54,
                                ),
                                onPressed: () {
                                  setState(() {
                                    passHidden1 = !passHidden1;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("Confirm Password",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(
                              height: 02.h,
                            ),
                            CustomForm(
                              textInputAction: TextInputAction.done,
                              submit: (_) async {
                                setState(() => loading = true);
                                await Future.delayed(
                                    const Duration(seconds: 3));
                                setState(() => loading = false);
                                UserData.saveData(context,
                                    email: email,
                                    password: password,
                                    valid: valid,
                                    text: "Your account  is registered");
                              },
                              hintText: "Confirm Your Password",
                              type: TextInputType.visiblePassword,
                              //Validator untuk mengecek password
                              validator: (value) {
                                if (value!.isEmpty || value != password) {
                                  valid = false;
                                  return 'Password is not matching';
                                } else if (password.length < 8) {
                                  valid = false;
                                  return 'Password is not accepted';
                                } else {
                                  valid = true;
                                  return null;
                                }
                              },
                              obscureText: passHidden2,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  passHidden2
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black54,
                                ),
                                onPressed: () {
                                  setState(() {
                                    passHidden2 = !passHidden2;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
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
                                          "Register",
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                  onPressed: () async {
                                    setState(() => loading = true);
                                    await Future.delayed(
                                        const Duration(seconds: 3));
                                    setState(() => loading = false);
                                    UserData.saveData(context,
                                        email: email,
                                        password: password,
                                        valid: valid,
                                        text: "Your account  is registered");
                                  })),
                          Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(
                                    fontSize: 10.sp, color: Colors.black54),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/login');
                                },
                                child: Text(
                                  "Login",
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
                          color: Colors.black54,
                        )),
                        Text(
                          "   Or Register with   ",
                          style:
                              TextStyle(color: Colors.black38, fontSize: 10.sp),
                        ),
                        const Expanded(
                            child: Divider(
                          color: Colors.black54,
                        )),
                      ]),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SimpleCircularIconButton(
                                name: "images/google.png",
                                radius: 30.sp,
                              ),
                              SimpleCircularIconButton(
                                name: "images/Apple.png",
                                radius: 30.sp,
                              ),
                              SimpleCircularIconButton(
                                name: "images/fb.png",
                                radius: 30.sp,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        height: 6.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "By signin up, you agree to our",
                                  style: TextStyle(
                                      fontSize: 10.sp, color: Colors.black54),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/TOS');
                                  },
                                  child: Text(
                                    " Terms of Service ",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 22, 199, 46)),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "and",
                                  style: TextStyle(
                                      fontSize: 10.sp, color: Colors.black54),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/PP');
                                  },
                                  child: Text(
                                    " Privacy Policy ",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                            255, 22, 199, 46)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
