import 'package:flutter/material.dart';
import 'package:login_app/widgets/DialogBox.dart';
import 'package:login_app/widgets/ItemList.dart';
import 'package:sizer/sizer.dart';

class ItemPage extends StatefulWidget {
  ItemPage({Key? key}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        //
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: WillPopScope(
                onWillPop: () async {
                  final exit = await DialogBox.showWarning(context);
                  return exit ?? false;
                },
                child: Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 80.w,
                            margin: EdgeInsets.only(
                              right: 2.w,
                            ),
                            child: Form(
                              child: TextFormField(
                                textInputAction: TextInputAction.done,
                                enableSuggestions: true,
                                cursorColor: Colors.black,
                                cursorHeight: 13.sp,
                                style: TextStyle(fontSize: 13.sp),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  hintText: "Search quiz",
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                    size: 23.sp,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.black38, width: 0.3.w)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.black38, width: 0.4.w)),
                                ),
                              ),
                            )),
                        InkWell(
                          splashColor: Colors.white,
                          onTap: () {},
                          child: Icon(
                            Icons.filter_list,
                            size: 25.sp,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  body: ListView(physics: BouncingScrollPhysics(), children: [
                    Column(
                      children: [
                        ItemList(
                          title: "Lorem ipsum",
                        ),
                        ItemList(
                          title: "Lorem ipsum",
                        ),
                        ItemList(
                          title: "Lorem ipsum",
                        ),
                        ItemList(
                          title: "Lorem ipsum",
                        ),
                        ItemList(
                          title: "Lorem ipsum",
                        ),
                        ItemList(
                          title: "Lorem ipsum",
                        ),
                        ItemList(
                          title: "Lorem ipsum",
                        ),
                      ],
                    )
                  ]),
                ))),
      );
    });
  }
}
