// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../utils/xprint.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterNotifier(),
      child: const MyApp(),
    ),
  );
}

class CounterNotifier with ChangeNotifier {
  int _value = 0;

  int get value => _value;

  void increment() {
    _value += 1;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    xPrint('MyApp build');
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    xPrint('MyHomePage build');
    // final count = context.select((CounterNotifier cn) => cn.value);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
        actions: [
          Consumer<CounterNotifier>(
            builder: (context, counter, child) {
              return IconButton(
                  onPressed: () => counter.increment(),
                  icon: const Icon(Icons.add));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            // Text(
            //   '1: ${Provider.of<CounterNotifier>(context, listen: true).value}',
            //   style: Theme.of(context).textTheme.headlineLarge,
            // ),
            Selector<CounterNotifier, Tuple2<int, int>>(
                selector: (_, cn) => Tuple2(cn.value, cn.value),
                builder: (_, data, __) {
                  return Text('${data.item1}  ${data.item2}');
                }),
            Selector<CounterNotifier, int>(
              selector: (sCtx, counterNotifier) => counterNotifier.value,
              builder: (bCtx, value, child) {
                return Text(
                  'selector: $value',
                  style: Theme.of(context).textTheme.headlineLarge,
                );
              },
            ),
            // Text(
            //   'ctx.slct: $count',
            //   style: Theme.of(context).textTheme.headlineLarge,
            // ),
          ],
        ),
      ),
    );
  }
}
