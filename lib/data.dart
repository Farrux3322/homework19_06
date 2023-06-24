import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:homework19_06/repository.dart';

import 'product_model.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key, required this.index});

  final int index;


  @override
  Widget build(BuildContext context) {

    final box = GetStorage();


    ProductModel item = MyRepository.data[index];
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        actions: [IconButton(onPressed: (){
          box.write("index", index);
        },icon:const Icon(Icons.save),)],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
          ),
          Image.asset(
            item.image,
            height: MediaQuery.sizeOf(context).height * .5,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            item.title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            item.describtion,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
