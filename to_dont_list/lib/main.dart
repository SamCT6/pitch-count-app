// Started with https://docs.flutter.dev/development/ui/widgets-intro
import 'package:flutter/material.dart';
import 'package:to_dont_list/objects/Grocery.dart';
import 'package:to_dont_list/widgets/to_do_grocery.dart';
import 'package:to_dont_list/widgets/to_do_dialog.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final List<Grocery> grocerys = [Grocery(name: "add your grocery", price: 0)];
  final _groceryset = <Grocery>{};

  void _handleListChanged(Grocery grocery, bool completed) {
    setState(() {
      // When a user changes what's in the list, you need
      // to change _groceryset inside a setState call to
      // trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.

      grocerys.remove(grocery);
      if (!completed) {
        print("Completing");
        _groceryset.add(grocery);
        grocerys.add(grocery);
      } else {
        print("Making Undone");
        _groceryset.remove(grocery);
        grocerys.insert(0, grocery);
      }
    });
  }

  void _handleDeleteGrocery(Grocery grocery) {
    setState(() {
      print("Deleting Grocery");
      grocerys.remove(grocery);
    });
  }

  void _handleNewGrocery(double price, String groceryText, TextEditingController textController, TextEditingController textController2) {
    setState(() {
      print("Adding new Grocery");
      Grocery grocery = Grocery(name: groceryText, price: price);
      grocerys.insert(0, grocery);
      textController.clear();
      textController2.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Grocery'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: grocerys.map((grocery) {
            return ToDoListGrocery(
              grocery: grocery,
              completed: _groceryset.contains(grocery),
              onListChanged: _handleListChanged,
              onDeleteGrocery: _handleDeleteGrocery,
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return ToDoDialog(onListAdded: _handleNewGrocery);
                  });
            }));
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Grossary List',
    home: ToDoList(),
  ));
}
