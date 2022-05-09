import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ItemList extends StatelessWidget {
  ItemList({
    required this.title,
    Key? key,
  }) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      elevation: 3,
      child: Row(
        children: [
          SizedBox(
            height: 20.h,
            child: const Image(
              image: AssetImage("images/default.png"),
            ),
          ),
          SizedBox(
            width: 3.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
              ),
              Container(
                width: 30.w,
                child: Text(
                  title,
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontSize: 11.sp, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text("Description :",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp)),
              Container(
                width: 39.w,
                child: Text(
                  "Lorem ipsum lorem lorem ipsum lorem",
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontSize: 10.sp, color: Colors.black45),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
