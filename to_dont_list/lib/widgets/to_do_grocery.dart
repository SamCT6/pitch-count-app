import 'package:flutter/material.dart';
import 'package:to_dont_list/objects/Grocery.dart';

typedef ToDoListChangedCallback = Function(Grocery grocery, bool completed);
typedef ToDoListRemovedCallback = Function(Grocery grocery);

class ToDoListGrocery extends StatelessWidget {
  ToDoListGrocery(
      {required this.grocery,
      required this.completed,
      required this.onListChanged,
      required this.onDeleteGrocery})
      : super(key: ObjectKey(grocery));

  final Grocery grocery;
  final bool completed;

  final ToDoListChangedCallback onListChanged;
  final ToDoListRemovedCallback onDeleteGrocery;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onListChanged(grocery, completed);
      },
      onLongPress: completed
          ? () {
              onDeleteGrocery(grocery);
            }
          : null,
      leading: CircleAvatar(

        child: Text(grocery.increase().toString()),
        
      ),
      title: Text(
        grocery.name,
      ),
    );
  }
}
