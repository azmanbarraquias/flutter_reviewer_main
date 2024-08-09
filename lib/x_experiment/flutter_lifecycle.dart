import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reviewer_main/utils/xprint.dart';

void main() {
  runApp(HomeHeader());
}

class HomeHeader extends StatelessWidget {
  HomeHeader({super.key}) {
    xPrint('HomeHeader({super.key})');
  }

  @override
  Widget build(BuildContext context) {
    xPrint('Widget build HomeHeader');
    return MaterialApp(
      home: Scaffold(
        body: HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  HomeBody({super.key}) {
    xPrint('HomeBody({super.key}) HomeBody');
  }

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with WidgetsBindingObserver {
  int i = 0;

  _HomeBodyState() {
    xPrint('_HomeBodyState');
  }

  @override
  Widget build(BuildContext context) {
    xPrint('Widget build HomeBody ${++i}');
    return Center(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            xPrint('_HomeBodyState setState()');
          });
        },
        child: Text('initState $i'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    xPrint('_HomeBodyState initState()');
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    xPrint('_HomeBodyState dispose()');
    WidgetsBinding.instance.removeObserver(this);
  }

  // called call when child also rebuild
  @override
  void didUpdateWidget(HomeBody oldWidget) {
    xPrint('_HomeBodyState didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
    xPrint('_HomeBodyState didUpdateWidget()');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    xPrint('_HomeBodyState didChangeAppLifecycleState() $state');
  }

  @override
  void didHaveMemoryPressure() {
    xPrint("didHaveMemoryPressure");
    super.didHaveMemoryPressure();
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    xPrint("didChangeLocales $locales");
    super.didChangeLocales(locales);
  }

  @override
  Future<AppExitResponse> didRequestAppExit() {
    xPrint("didRequestAppExit");
    return super.didRequestAppExit();
  }
}

