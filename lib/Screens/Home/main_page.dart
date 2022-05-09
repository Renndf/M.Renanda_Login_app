import 'package:flutter/material.dart';
import 'package:login_app/main.dart';

import 'profile_page.dart';
import 'item_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  PageController _pageController = PageController(initialPage: 0);
  int index = 0;
  void onTap(int temp) {
    setState(() {
      index = temp;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/main': (context) => const MyApp(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          onTap: (index) {
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          },
          currentIndex: index,
          selectedItemColor: const Color.fromARGB(255, 22, 199, 46),
          unselectedItemColor: Colors.black12,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedFontSize: 0,
          selectedFontSize: 15,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Discover"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
        ),
        body: PageView(
          physics: const BouncingScrollPhysics(),
          onPageChanged: onTap,
          controller: _pageController,
          children: [HomePage(), ItemPage(), ProfilePage()],
        ),
      ),
    );
  }
}
