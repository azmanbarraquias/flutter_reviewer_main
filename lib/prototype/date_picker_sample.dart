import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: DatePickerSample(),
    ),
  ));
}

class DatePickerSample extends StatefulWidget {
  const DatePickerSample({super.key});

  @override
  State<DatePickerSample> createState() => _DatePickerSampleState();
}

class _DatePickerSampleState extends State<DatePickerSample> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: TextField(
          controller: _dateController,
          onTap: () {
            _selectDate();
          },
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'DATE ${DateTime.now().toString().split(" ")[0]}',
            filled: true,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.red,
            )),
            prefixIcon: const Icon(Icons.calendar_today),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      setState(() {
        _dateController.text = pickedDate.toString().split(" ")[0];
      });
    }
  }
}
