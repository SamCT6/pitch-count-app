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

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different
    // parts of the tree can have different themes.
    // The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return completed //
        ? Colors.black54
        : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!completed) return null;

    return const TextStyle(
      color: Color.fromARGB(137, 245, 11, 11),
      decoration: TextDecoration.lineThrough,
    );
  }

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
      leading: ElevatedButton(
        onPressed: (){
            grocery.increase();
        },
        child: Text(grocery.increase().toString()),
      ),
      title: Text(
        grocery.name,
        style: _getTextStyle(context),
      ),
    );
  }
}
