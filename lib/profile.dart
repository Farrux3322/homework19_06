import 'package:flutter/material.dart';

import 'main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

int change = 0;

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(children: [
        Row(
          children: [
            const SizedBox(
              width: 24,
            ),
            const Text(
              'Login :',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              '${sharedPreferences.getString('nimadir')}',
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 24,
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  const Text(
                    'Password :',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  (change % 2 == 0)
                      ? Text(
                          '${sharedPreferences.getString('qandaydir')}',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 15, 13, 13),
                              fontSize: 20),
                        )
                      : Text(
                          getStarts(sharedPreferences.getString('qandaydir')!)),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {});
                        change++;
                      },
                      child: const Icon(Icons.person)),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 57,
              width: 326,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                  sharedPreferences.setString('nimadir', '');
                  sharedPreferences.setString('qandaydir', '');
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                    elevation: const MaterialStatePropertyAll<double>(10),
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(Colors.red)),
                child: const Text(
                  'Log out',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ]),
    );
  }


  String getStarts(String text){
    String ans = "";
    for(var i = 0; i < text.length;i++){
      ans+="*";
    }
    return ans;
  }
}
