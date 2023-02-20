import 'package:flutter/material.dart';
import '../models/todo.dart';

class ToDoListItem extends StatefulWidget {
  ToDoListItem(this.toDoList, this.index);
  //bool _value;
  List<ToDo> toDoList;
  int index;

  @override
  State<ToDoListItem> createState() => _ToDoListItemState();
}

class _ToDoListItemState extends State<ToDoListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: CheckboxListTile(
        title: Text(widget.toDoList[widget.index].title),
        subtitle: Text(widget.toDoList[widget.index].date.toString()),
        autofocus: false,
        activeColor: Colors.grey,
        checkColor: Colors.white,
        selected: widget.toDoList[widget.index].isDone,
        value: widget.toDoList[widget.index].isDone,
        onChanged: (bool? value) {
          setState(() {
            widget.toDoList[widget.index].isDone = value!;
          });
        },
      ),
    );
  }
}
