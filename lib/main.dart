import 'package:flutter/material.dart';
import './widgets/todo_list_item.dart';
import './models/todo.dart';
import './new_todo_list_item.dart';

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

  void addToListModal(BuildContext ctx) {
    //todoList.add(value)
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTodoListItem(addToList),
        );
      },
    );
  }

  void addToList(String title, bool isDone, DateTime addedDate) {
    setState(() {
      todoList.add(ToDo(title: title, isDone: false, date: addedDate));
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
              addToListModal(context);
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addToListModal(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
