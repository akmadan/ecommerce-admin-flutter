import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin/features/edit_product/ui/edit_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ViewProductsPage extends StatefulWidget {
  const ViewProductsPage({super.key});

  @override
  State<ViewProductsPage> createState() => _ViewProductsPageState();
}

class _ViewProductsPageState extends State<ViewProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: Container(
        margin: const EdgeInsets.all(14),
        child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('products').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final productsDocs = snapshot.data?.docs ?? [];
                return ListView.builder(
                    itemCount: productsDocs.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        padding: const EdgeInsets.all(14),
                        margin: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productsDocs[index]['name'],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(productsDocs[index]['description']),
                                  const SizedBox(height: 12),
                                  Text(
                                    productsDocs[index]['status'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: productsDocs[index]['status'] ==
                                                'SOLD OUT'
                                            ? Colors.red
                                            : Colors.deepPurple,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    height: 34,
                                    width: 100,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditProductPage(
                                                          name: productsDocs[
                                                              index]['name'],
                                                          description:
                                                              productsDocs[index]
                                                                  [
                                                                  'description'],
                                                          price: productsDocs[
                                                              index]['price'],
                                                          status:
                                                              productsDocs[index]
                                                                  ['status'],
                                                          productId:
                                                              productsDocs[index]
                                                                  .id)));
                                        },
                                        child: Text('EDIT')),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              'Rs. ' +
                                  productsDocs[index]['price'].toString() +
                                  '/-',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    }));
              }
            }),
      ),
    );
  }
}
