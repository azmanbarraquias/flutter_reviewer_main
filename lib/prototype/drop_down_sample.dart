import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: DropDownSample(),
    ),
  ));
}

class DropDownSample extends StatefulWidget {
  const DropDownSample({super.key});

  @override
  State<DropDownSample> createState() => _DropDownSampleState();
}

class _DropDownSampleState extends State<DropDownSample> {
  String? _dropdownValue = '1';
  final _items = ['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: DropdownButton(
            underline: Container(),
            style: const TextStyle(fontSize: 30, color: Colors.red),
            icon: const Icon(Icons.keyboard_double_arrow_down),
            borderRadius: BorderRadius.circular(10),
            value: _dropdownValue,
            items: _items.map((String item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList(),
            onChanged: (String? value) {
              setState(
                () {
                  _dropdownValue = value;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
