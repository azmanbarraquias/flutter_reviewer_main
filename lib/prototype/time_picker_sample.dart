import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${_timeOfDay.hour.toString().padLeft(2, "0")} : ${_timeOfDay.minute.toString().padLeft(2, "0")} ',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 30,
        ),
        MaterialButton(
          onPressed: () {
            _selectTime();
          },
          height: 50,
          minWidth: 150,
          color: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'Open Time Picker',
            style: TextStyle(color: Colors.amber),
          ),
        )
      ],
    ));
  }

  Future<void> _selectTime() async {
    // cancel return null else timeofday selected
    TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _timeOfDay);

    if (picked != null) {
      setState(() {
        _timeOfDay = picked;
      });
    }
  }
}
