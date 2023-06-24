import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:homework19_06/basket.dart';
import 'package:homework19_06/profile.dart';

import 'all.dart';
import 'home_screen.dart';

class TabsBox extends StatefulWidget {
  TabsBox({Key? key}) : super(key: key);

  @override
  State<TabsBox> createState() => _TabsBoxState();
}

class _TabsBoxState extends State<TabsBox> {
  int _currentIndex = 0;

  List<Widget> screens = [];


  @override
  void initState() {

    final box = GetStorage();
    final index = box.read("index") ?? 0;
    screens.add(HomeScreen());
   screens.add(Basket(index: index));
    screens.add(AllScreenButton());
    screens.add(ProfileScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: screens[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.greenAccent,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.house, size: 30), label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.text_badge_checkmark,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month_outlined,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: ""),
          ],
        ),
      ),
    );
  }
}
