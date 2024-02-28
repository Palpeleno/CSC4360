// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './common/color_extension.dart';
import './view/main_tab/main_tab_view.dart';
// import './view/home/';
// import './view/login';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JMT',
      debugShowCheckedModeBanner: false,
      // This is the theme of your application.
      // TODO color extensions and fonts refractor to proper colore schema
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: TColor.base,
            background: TColor.baseAlpha,
            primary: TColor.primary,
            primaryContainer: TColor.primaryAlpha,
            secondary: TColor.secondary),
        useMaterial3: false,
      ),
      home: const MainTabView(),
    );
  }
}
