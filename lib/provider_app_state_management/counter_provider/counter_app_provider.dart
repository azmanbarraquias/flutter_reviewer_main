// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Provide the model to all widgets within the app. We're using
    // ChangeNotifierProvider because that's a simple way to rebuild
    // widgets when a model changes. We could also just use
    // Provider, but then we would have to listen to Counter ourselves.
    //
    // Read Provider's docs to learn about all the available providers.
    //   ChangeNotifierProvider(
    //     create: (context) => Counter(),
    //     child: const MyApp(),
    //   )
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Counter1()),
          ChangeNotifierProvider(create: (context) => Counter2()),
        ],
        child: const MyApp(),
      )
  );
}

/// Simplest possible model, with just one field.
///
/// [ChangeNotifier] is a class in `flutter:foundation`. [Counter1] does
/// _not_ depend on Provider.
class Counter1 with ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }

}

class Counter2 with ChangeNotifier {
  int value = 0;

  void increment() {
    value += 2;
    notifyListeners();
  }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
        actions: [
          Consumer<Counter1>(builder: (context, counter, child) {
            return IconButton(
                onPressed: () => counter.increment()
                ,
                icon: const Icon(Icons.add));
          },),
          IconButton(
              onPressed: () {
                Provider.of<Counter2>(context, listen: false).increment();
              },
              icon: const Icon(Icons.add, color: Colors.red,)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '1: ${Provider.of<Counter1>(context, listen: true).value}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            // Consumer looks for an ancestor Provider widget
            // and retrieves its model (Counter, in this case).
            // Then it uses that model to build widgets, and will trigger
            // rebuilds if the model is updated.
            Consumer<Counter2>(builder: (context, counter, child) {
              return Text(
                '2: ${counter.value}',
                style: Theme.of(context).textTheme.headlineLarge,
              );
            }),
          ],
        ),
      ),
    );
  }
}
