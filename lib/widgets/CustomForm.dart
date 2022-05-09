import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomForm extends StatelessWidget {
  CustomForm({
    required this.hintText,
    required this.type,
    this.onChanged,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.textInputAction,
    this.submit,
    Key? key,
  }) : super(key: key);

  String hintText = "Your hint Text";
  TextInputType type = TextInputType.name;
  Function(String)? onChanged;
  String? Function(String?)? validator;
  IconButton? suffixIcon;
  bool obscureText;
  TextEditingController? controller;
  TextInputAction? textInputAction;
  Function(String)? submit;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: submit,
      textInputAction: textInputAction,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: type,
      onChanged: onChanged,
      style: TextStyle(fontSize: 11.sp),
      autofocus: false,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          errorStyle: TextStyle(fontSize: 11.sp),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 11.sp),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: const Color.fromARGB(255, 191, 0, 0), width: 0.6.w)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: const Color.fromARGB(255, 191, 0, 0), width: 0.3.w)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: const Color.fromARGB(255, 22, 199, 46), width: 0.6.w)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7))),
    );
  }
}
