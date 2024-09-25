import 'package:flutter/material.dart';

typedef ToDoListAddedCallback = Function(
    int price, String value, TextEditingController textConroller, TextEditingController textController2);

class ToDoDialog extends StatefulWidget {
  const ToDoDialog({
    super.key,
    required this.onListAdded,
  });

  final ToDoListAddedCallback onListAdded;

  @override
  State<ToDoDialog> createState() => _ToDoDialogState();
}

class _ToDoDialogState extends State<ToDoDialog> {
  // Dialog with text from https://www.appsdeveloperblog.com/alert-dialog-with-a-text-field-in-flutter/
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _inputController2 = TextEditingController();
  
  final ButtonStyle yesStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: const Color.fromARGB(193, 196, 115, 228));
  
  final ButtonStyle noStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: const Color.fromARGB(141, 191, 187, 186));

  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Grocery'),
      content:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _inputController,
            decoration: const InputDecoration(labelText: 'Grocery name'),
          ),
          TextField(
            controller: _inputController2,
            decoration: const InputDecoration(labelText: 'Price'),
            //keyboardType: TextInputType.number,
          ),
        ],
      ),

      actions: <Widget>[
        ElevatedButton(
          key: const Key("CancelButton"),
          style: noStyle,
          child: const Text('Cancel'),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),

        // https://stackoverflow.com/questions/52468987/how-to-turn-disabled-button-into-enabled-button-depending-on-conditions
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: _inputController,
          builder: (context, value, child) {
            return ElevatedButton(
              key: const Key("OKButton"),
              style: yesStyle,
              onPressed: value.text.isNotEmpty && _inputController2.text.isNotEmpty
                  ? () {
                    String valueText = _inputController.text;
                    int priceText = int.parse(_inputController2.text);
                    // https://stackoverflow.com/questions/56207275/how-can-i-get-int-data-from-texteditingcontroller-in-flutter
                    // To change the string pulled from string to an int
                      setState(() {
                        widget.onListAdded(priceText, valueText, _inputController, _inputController2);
                        Navigator.pop(context);
                      });
                    }
                  : null,
              child: const Text('OK'),
            );
          },
        ),
      ],
    );
  }
}
