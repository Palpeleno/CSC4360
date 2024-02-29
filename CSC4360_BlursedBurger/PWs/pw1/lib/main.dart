// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import './common/color_extension.dart';
import './view/main_tab/main_tab_view.dart';
// import './view/home/';
// import './view/login';
import 'package:flutter/material.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
    );
  }
}
