import 'package:flutter/material.dart';

import 'main.dart';

class AllScreenButton extends StatefulWidget {
  const AllScreenButton({super.key});

  @override
  State<AllScreenButton> createState() => _AllState();
}

class _AllState extends State<AllScreenButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(children: [
        TextField(
          onChanged: (value) => buttunEmail(value),
          decoration: InputDecoration(hintText: 'email'),
        ),
        TextField(
          onChanged: (value) => buttunLogin(value),
          decoration: InputDecoration(hintText: 'password'),
        ),
      ]),
    );
  }

  void buttunEmail(String value) async {
    var pref = await sharedPreferences.setString('nimadir', value);
  }

  buttunLogin(String value) async {
    var pref = await sharedPreferences.setString('qandaydir', value);
  }
}
