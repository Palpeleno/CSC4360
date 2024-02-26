// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

//imported utility packages
import 'dart:convert';
import 'package:flutter/material.dart';
// imported packages from web foreign packges
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
// imported domestic file screens
import '../model/task.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});
  static const routeName = '/home-screen';

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  var _TaskListScreenController;

  // save individual notes that are activiely been worked on... not functioning
  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Task t = Task.fromString(_TaskListScreenController.text);
    // obtains datastructure of words in text field "ie:map" of notet text as var t of task
    // store list of task, so every added list is added to list then retrved to save prefs
    String tasks = prefs.getString('task');
    List list = (tasks == null) ? [] : json.decode(tasks);
    print(list);
    list.add(json.encode(t.getMap()));
    print(list);
    prefs.setString('task', json.encode(list));
    _TaskListScreenController.text = '';
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _TaskListScreenController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _TaskListScreenController.dispose();
    super.dispose();
  }

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
            padding: const EdgeInsets.all(10.0),
            height: 250,
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
                  controller: _TaskListScreenController,
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
                          onPressed: () => _TaskListScreenController.text = '',
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
                          onPressed: () => saveData,
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
