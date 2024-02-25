// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
// import './home_screen.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TaskManager',
          style: GoogleFonts.comicNeue(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Center(
        child: Text("No Tasks added yet!"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.green[800],
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => Container(
            padding: const EdgeInsets.all(15.0),
            height: 500,
            color: Colors.green[200],
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add Task',
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        color: Colors.green[900],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(Icons.close),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1.8,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Enter Task",
                    hintStyle: GoogleFonts.comicNeue(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  width: MediaQuery.of(context).size.width,
                  // height: 200.0,
                  child: Row(
                    children: [
                      Container(
                        // padding: EdgeInsets.symmetric(horizontal: 5.0),
                        width: (MediaQuery.of(context).size.width / 2) - 20,
                        child: FloatingActionButton(
                          hoverColor: Colors.white,
                          child: Text(
                            'RESET',
                            style: GoogleFonts.montserrat(),
                          ),
                          onPressed: () => print('reset pressed'),
                        ),
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width / 2) - 20,
                        child: FloatingActionButton(
                          hoverColor: Colors.white,
                          child: Text(
                            'ADD',
                            style: GoogleFonts.montserrat(),
                          ),
                          onPressed: () => print('add pressed'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
