// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/xprint.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0x9f4376f8),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Could\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    setState(() {
      _connectionStatus = result;
    });
    // ignore: avoid_xPrint

    if (_connectionStatus.contains(ConnectivityResult.mobile)) {
      xPrint('Connectivity changed: $_connectionStatus');

      // Mobile network available.
    } else if (_connectionStatus.contains(ConnectivityResult.wifi)) {
      xPrint('Connectivity changed: $_connectionStatus');

      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
    } else if (_connectionStatus.contains(ConnectivityResult.ethernet)) {
      xPrint('Connectivity changed: $_connectionStatus');

      // Ethernet connection available.
    } else if (_connectionStatus.contains(ConnectivityResult.vpn)) {
      // Vpn connection active.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      xPrint('Connectivity changed: $_connectionStatus');

      // It returns [other] on any device (also simulator)
    } else if (_connectionStatus.contains(ConnectivityResult.bluetooth)) {
      // Bluetooth connection available.
      xPrint('Connectivity changed: $_connectionStatus');
    } else if (_connectionStatus.contains(ConnectivityResult.other)) {
      // Connected to a network which is not in the above mentioned networks.
      xPrint('Connectivity changed: $_connectionStatus');
    } else if (_connectionStatus.contains(ConnectivityResult.none)) {
      xPrint('Connectivity changed: $_connectionStatus');

      // No available network types
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectivity Plus Example'),
        elevation: 4,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(flex: 2),
          Text(
            'Active connection types:',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Spacer(),
          ListView(
            shrinkWrap: true,
            children: List.generate(
                _connectionStatus.length,
                (index) => Center(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Connectivity changed: ${_connectionStatus[index].toString()}',
                          ),
                        ),
                      ),
                    )),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
