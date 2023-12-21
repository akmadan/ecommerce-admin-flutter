import 'package:ecommerce_admin/features/add_products/bloc/add_product_bloc.dart';
import 'package:flutter/material.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  String name = '';
  String description = '';
  double price = 0;
  String status = '';

  TextEditingController namecontroller = TextEditingController();

  TextEditingController desccontroller = TextEditingController();

  TextEditingController pricecontroller = TextEditingController();

  TextEditingController statuscontroller = TextEditingController();
  final AddProductBloc addProductBloc = AddProductBloc();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Product'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                key:const  ValueKey('name'),
                controller: namecontroller,
                decoration: const InputDecoration(hintText: 'Enter Product Name'),
                onSaved: (newValue) {
                  setState(() {
                    name = newValue ?? '';
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Name';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                key:const  ValueKey('desc'),
                controller: desccontroller,
                decoration:
                    const InputDecoration(hintText: 'Enter Product Description'),
                onSaved: (newValue) {
                  setState(() {
                    description = newValue ?? '';
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Description';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                key: const ValueKey('price'),
                controller: pricecontroller,
                decoration: const InputDecoration(hintText: 'Enter Product Price'),
                onSaved: (newValue) {
                  setState(() {
                    price = double.parse(newValue ?? '0');
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Price';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                key: const ValueKey('status'),
                controller: statuscontroller,
                decoration:const  InputDecoration(hintText: 'Enter Product Status'),
                onSaved: (newValue) {
                  setState(() {
                    status = newValue ?? '';
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Status';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          addProductBloc.add(AddProductDataEvent(
                              productName: name,
                              description: description,
                              price: price,
                              status: status));
                        }
                      },
                      child:const  Text('Add Product')))
            ],
          ),
        ),
      ),
    );
  }
}
