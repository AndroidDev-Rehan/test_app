import 'package:flutter/material.dart';

class MyDropDownButton extends StatefulWidget {
  String dropdownValue;
  final List<String> items;
  Color? textColor;
  Color? iconColor;
  Color? backgroundColor;


  MyDropDownButton({Key? key, required this.dropdownValue, required this.items, this.textColor, this.iconColor, this.backgroundColor}) : super(key: key);

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  // String dropdownValue = widget.dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: false,
      value: widget.dropdownValue,
      isDense: true,
      alignment: Alignment.centerRight,
      dropdownColor: widget.backgroundColor,
      icon: Icon(
        Icons.arrow_drop_down,
        color: widget.iconColor ?? Colors.green,
        size: 30,
      ),
      // elevation: 16,
      // style: const TextStyle(color: Colors.deepPurple),
      underline: const SizedBox(
        height: 0,
        width: 0,
      ),
      onChanged: (String? newValue) {
        setState(() {
          widget.dropdownValue = newValue!;
        });
      },
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              value,
              style:  TextStyle(color: widget.textColor ?? Colors.green),
            ),
          ),
        );
      }).toList(),
    );
  }
}
