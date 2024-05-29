import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink,
        title: const Text("Dismissible Text"),
      ),
      body: const SafeArea(child: DismissibleListView()),
    ),
  ));
}

class DismissibleListView extends StatefulWidget {
  const DismissibleListView({super.key});

  @override
  State<DismissibleListView> createState() => _DismissibleListViewState();
}

class _DismissibleListViewState extends State<DismissibleListView> {
  List<String> items = [
    'Azman',
    'Azuma',
    'JazzPlaySoloQ',
    'DevAzuma',
    'Jazzman',
    'JazzMan17',
    'AkiraUno''Azman',
    'Azuma',
    'JazzPlaySoloQ',
    'DevAzuma',
    'Jazzman',
    'JazzMan17',
    'AkiraUno'  'Azman',
    'Azuma',
    'JazzPlaySoloQ',
    'DevAzuma',
    'Jazzman',
    'JazzMan17',
    'AkiraUno''Azman',
    'Azuma',
    'JazzPlaySoloQ',
    'DevAzuma',
    'Jazzman',
    'JazzMan17',
    'AkiraUno'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    onDismissed: (direction) {
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        return await showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                  title: const Text("Delete"),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: const Text("Yes")),
                                    ElevatedButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: const Text("No")),
                                  ],
                                  content: const Text(
                                      "Are you sure you want to delete this cart?"));
                            });
                      }
                      return null;
                    },
                    background: Container(
                      color: Colors.red,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'Delete',
                        textAlign: TextAlign.left,
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        'Save',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    key: ValueKey<String>(items[index]),
                    child: Container(
                      color: Colors.yellow,
                      margin: const EdgeInsets.only(top: 10),
                      height: 50,
                      child: Center(child: Text(items[index])),
                    ));
              }),
        ),
      ],
    );
  }
}
