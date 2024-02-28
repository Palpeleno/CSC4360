// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class JounralView extends StatefulWidget {
  const JounralView({super.key});

  @override
  State<JounralView> createState() => JounralViewState();
}

class JounralViewState extends State<JounralView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Journal Pages"),
      ),
      backgroundColor: Colors.blueGrey,
      body: Text(''),
    );
  }
}
