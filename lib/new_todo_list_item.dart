import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewTodoListItem extends StatefulWidget {
  const NewTodoListItem({super.key});

  @override
  State<NewTodoListItem> createState() => _NewTodoListItemState();
}

class _NewTodoListItemState extends State<NewTodoListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //TextField(),
        Text("New item"),
        ElevatedButton(onPressed: () {}, child: Text("Done"))
      ],
    );
  }
}
