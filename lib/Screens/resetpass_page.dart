import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:login_app/widgets/CustomForm.dart';
import 'package:login_app/widgets/CustomButton.dart';
import '../UserData.dart';

class ResetpassPage extends StatefulWidget {
  ResetpassPage({Key? key}) : super(key: key);

  @override
  State<ResetpassPage> createState() => _ResetpassPageState();
}

class _ResetpassPageState extends State<ResetpassPage> {
  bool passHidden1 = true;
  bool passHidden2 = true;
  bool valid = false; // deteksi apakah password hidden
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
                        height: 23.h,
                        width: 23.h,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("images/lock.png"))),
                      ),
                      SizedBox(
                        height: 02.h,
                      ),
                      Center(
                        child: Text(
                          "Create Your New Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20.sp),
                        ),
                      ),
                      SizedBox(
                        height: 02.h,
                      ),
                      Text(
                        "Your new password must be different from previously used passwords.",
                        style: TextStyle(fontSize: 12.sp),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 03.h,
                      ),
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("Password",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500)),
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
                                  return 'Password is required';
                                } else if (value.length < 8) {
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
                                    fontWeight: FontWeight.w500)),
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
                                UserData.resetPass(
                                  context,
                                  password: password,
                                  valid: valid,
                                );
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
                                      "Reset",
                                      style: TextStyle(fontSize: 15.sp),
                                    ),
                              onPressed: () async {
                                setState(() => loading = true);
                                await Future.delayed(
                                    const Duration(seconds: 3));
                                setState(() => loading = false);
                                UserData.resetPass(
                                  context,
                                  password: password,
                                  valid: valid,
                                );
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
