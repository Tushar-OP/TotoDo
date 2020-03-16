import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tododo/widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:tododo/models/task_data.dart';
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> colors = [
    Color(0xFF487BEA),
    Color(0xFF165DC0),
    Color(0xFF0E90E1),
    Color(0xFF083663),
    Color(0xFF2D365C),
    Color(0xFF07489C),
    Color(0xFF42539E),
    Color(0xFF504f63),
    Color(0xFF2f332E),
    Color(0xFF606664),
    Color(0xFF341037),
    Color(0xFF372025),
  ];

  Random random = Random();
  int index = 0;

  void changeIndex() {
    setState(() {
      index = random.nextInt(12);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[index],
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors[index],
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                left: 30.0, top: 60.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    changeIndex();
                  },
                  child: CircleAvatar(
                    child: Icon(
                      Icons.list,
                      color: colors[index],
                      size: 30.0,
                    ),
                    radius: 30.0,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TypewriterAnimatedTextKit(
                  totalRepeatCount: 2,
                  speed: Duration(milliseconds: 400),
                  text: ['TotoDo'],
                  textStyle: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  textAlign: TextAlign.start,
                ),
                Text(
                  '${TaskData().taskCount} Tasks',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
