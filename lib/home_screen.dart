import 'package:flutter/material.dart';
import 'package:homework19_06/product_model.dart';
import 'package:homework19_06/repository.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'all.dart';
import 'data.dart';
import 'main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'Product',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.7,
                ),
                children: List.generate(MyRepository.data.length, (index) {
                  ProductModel productItem = MyRepository.data[index];
                  return ZoomTapAnimation(
                    onTap: () {
                      if (sharedPreferences.getString('nimadir') == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const AllScreenButton();
                            },
                          ),
                        );
                      } else if (sharedPreferences.getString('nimadir') == '') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const AllScreenButton();
                            },
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DataScreen(
                                index: index,
                              );
                            },
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blueAccent,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            productItem.image,
                            height: 120,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'nomi ${productItem.title}',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          RichText(
                              text: TextSpan(
                                  text: 'narxi - ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                  children: [
                                TextSpan(
                                    text: productItem.price,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.red))
                              ])),
                          RichText(
                              text: TextSpan(
                                  text: '',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                TextSpan(
                                    text: '${productItem.sale} so`m',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.brown))
                              ])),
                        ],
                      ),
                    ),
                  );
                })),
          ),
        ],
      ),
    );
  }
}
