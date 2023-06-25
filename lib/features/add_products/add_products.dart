import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Product'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              key: ValueKey('name'),
              decoration: InputDecoration(hintText: 'Enter Product Name'),
            ),
            TextFormField(
              key: ValueKey('desc'),
              decoration: InputDecoration(hintText: 'Enter Product Description'),
            ),
            TextFormField(
              key: ValueKey('price'),
              decoration: InputDecoration(hintText: 'Enter Product Price'),
            ),
            TextFormField(
              key: ValueKey('status'),
              decoration: InputDecoration(hintText: 'Enter Product Status'),
            ), 
            const SizedBox(height: 20), 
            SizedBox(
              height: 50, 
              width: double.maxFinite,
              child: ElevatedButton(onPressed: (){}, child: Text('Add Product')))
          ],
        ),
      ),
    );
  }
}
