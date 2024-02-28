// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

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
  late List<Task> _tasks;
  late List<bool> _tasksDone;

  // save individual notes that are activiely been worked on... not functioning
  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Task t = Task.fromString(_TaskListScreenController.text);
    // obtains datastructure of words in text field "ie:map" of notet text as var t of task
    // store list of task, so every added list is added to list then retrved to save prefs
    // some ide fix aking var tasks null -> "String?" -> fixed the error
    String? tasks = prefs.getString('task');
    // ignore: unnecessary_null_comparison
    List list = (tasks == null) ? [] : json.decode(tasks);
    // ignore: avoid_print
    print(list);
    list.add(json.encode(t.getMap()));
    // ignore: avoid_print
    print(list);
    prefs.setString('task', json.encode(list));
    _TaskListScreenController.text = '';
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  // encodes string to a list then to a map
  Future<void> _getTask() async {
    _tasks = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tasks = prefs.getString('task');
    // ignore: unnecessary_null_comparison
    List list = (tasks == null) ? [] : json.decode(tasks);
    for (dynamic d in list) {
      // ignore: avoid_print
      print(d.runtimeType);
      _tasks.add(Task.fromMap(json.decode(d)));
    }

    // ignore: avoid_print
    print(_tasks);

    _tasksDone = List.generate(_tasks.length, (index) => false);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _TaskListScreenController = TextEditingController();

    _getTask();
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
      // ignore: unnecessary_null_comparison
      body: (_tasks == null)
          ? Center(
              child: Text("No Tasks added yet!"),
              // conditoinal rendering keeping a no task added widget and only renders if there are new tasks added
            )
          : Column(
              children: _tasks
                  .map((e) => Container(
                        height: 70.0,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        padding: const EdgeInsets.only(left: 10.0),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e.task,
                              style: GoogleFonts.comicNeue(),
                            ),
                            Checkbox(
                              value: _tasksDone[_tasks.indexOf(e)],
                              key: GlobalKey(),
                              onChanged: (val) {
                                setState(() {
                                  _tasksDone[_tasks.indexOf(e)] = val!;
                                });
                              },
                            ),
                          ],
                        ),
                      ))
                  .toList(),
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
