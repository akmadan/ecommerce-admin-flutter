import 'package:ecommerce_admin/app.dart';
import 'package:ecommerce_admin/design/theme.dart';
import 'package:ecommerce_admin/features/dashboard/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

 void main(List<String> args) async{ 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  

  runApp(new MyApp());
  
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      theme: AppTheme.lighThemeData,
      home: DashboardPage(),
    );
  }
}