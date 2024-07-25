
import 'package:flutter/material.dart';

import '../pages/login_page.dart';
import '../theme/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Трекер задач',
      theme: DoDidDoneTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<String> tasks = [];

  void _addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Трекер задач'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteTask(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String newTask = '';
              return AlertDialog(
                title: Text('Добавить задачу'),
                content: TextField(
                  onChanged: (value) {
                    newTask = value;
                  },
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Отмена'),
                  ),
                  TextButton(
                    onPressed: () {
                      _addTask(newTask);
                      Navigator.of(context).pop();
                    },
                    child: Text('Добавить'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

