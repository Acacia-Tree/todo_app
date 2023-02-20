import 'package:flutter/material.dart';
import './widgets/todo_list_item.dart';
import './models/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'To-do app'),
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
  //bool _value = false;
  List<ToDo> todoList = [
    ToDo(title: "Go shopping", isDone: false, date: DateTime.now()),
    ToDo(title: "Clean the house", isDone: false, date: DateTime.now()),
    ToDo(title: "Feed the cat", isDone: false, date: DateTime.now())
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _incrementCounter();
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: ((context, index) {
            return ToDoListItem(todoList, index);
          })),
      // ToDoListItem(_value), //CheckboxListTile

      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
