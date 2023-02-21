import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import './models/todo.dart';

class NewTodoListItem extends StatefulWidget {
  Function addToList;
  NewTodoListItem(this.addToList);

  @override
  State<NewTodoListItem> createState() => _NewTodoListItemState();
}

class _NewTodoListItemState extends State<NewTodoListItem> {
  final _titleController = TextEditingController();

  void submitData() {
    widget.addToList(_titleController.text, false, DateTime.now());
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          MediaQuery.of(context).viewInsets.bottom == 0 ? 150 : double.infinity,
      padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 5,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //TextField(),
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: _titleController,
            //onSubmitted: () {}
          ),
          ElevatedButton(
              onPressed: () {
                submitData();
              },
              child: Text("Done")),
          //Padding(padding: MediaQuery.of(context).viewInsets)
        ],
      ),
    );
  }
}
