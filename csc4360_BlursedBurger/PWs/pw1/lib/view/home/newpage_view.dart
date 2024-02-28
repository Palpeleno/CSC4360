// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../common/color_extension.dart';

class NewJournalPageView extends StatefulWidget {
  const NewJournalPageView({super.key});

  @override
  State<NewJournalPageView> createState() => _NewJournalPageViewState();
}

class _NewJournalPageViewState extends State<NewJournalPageView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        // $title\ in the app bar titile when naming a new journal page
        title: const Text('journal page title'),
      ),
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ignore: unnecessary_const
            Container(
              height: media.width * .8,
              decoration: BoxDecoration(
                  color: TColor.primary.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
          ],
        ),
      ),
    );
  }
}
