import 'package:employee_management/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF8F8F8),
        appBarTheme: AppBarTheme(backgroundColor: Colors.greenAccent.shade200),
      ),
      home: const Homepage(),
    );
  }
}
