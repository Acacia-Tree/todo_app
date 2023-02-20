import 'package:flutter/material.dart';

class ToDoListItem extends StatefulWidget {
  ToDoListItem(this._value);
  bool _value;

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
        title: const Text('GeeksforGeeks'),
        subtitle: Text(DateTime.now().toString()),
        autofocus: false,
        activeColor: Colors.grey,
        checkColor: Colors.white,
        selected: widget._value,
        value: widget._value,
        onChanged: (bool? value) {
          setState(() {
            widget._value = value!;
          });
        },
      ),
    );
  }
}
