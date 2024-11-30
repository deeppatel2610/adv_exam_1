import 'package:adv_exam_1/provider/home_provder.dart';
import 'package:adv_exam_1/screens/cart_page.dart';
import 'package:adv_exam_1/screens/ditel_psge.dart';
import 'package:adv_exam_1/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) => MaterialApp(
        routes: {
          '/': (context) => const HomePage(),
          '/ditel': (context) => const DitelPsge(),
          '/cart': (context) => const CartPage(),
        },
      ),
    );
  }
}
