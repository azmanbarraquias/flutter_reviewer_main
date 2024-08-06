import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../utils/xprint.dart';
import 'app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
        ),
      ),
      // List all of the app's supported locales here. . .
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('fil', 'PH'),
      ],
      // These delegate make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        // This class will be added later
        // A class which loads tje translation from JSON files
        AppLocalizations.delegate, // cupertino

        // Build-in localization basic text for material widgets
        GlobalMaterialLocalizations.delegate,

        // Build-in localization basic text for direction LTR/RTL
        GlobalWidgetsLocalizations.delegate
      ],
      localeListResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supporteda
        int i = 0;
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?[i].languageCode &&
              supportedLocale.countryCode == locale?[i].countryCode) {
            i++;
            return supportedLocale;
          }
        }

        // If the locale of the device is
        //not supported, use the first onefrom the list (English, in this case)
        return supportedLocales.first;
      },
      home: const MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  final title = 'I Like Flutter';

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.language))
        ],
        title: Text('${appLocalization?.translate('title')}:)'),
      ),
      body: SafeArea(
        child: Center(
          // Start Here
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${appLocalization?.translate('body_content')}:)'),
              Text(
                  'Current Language:   ${appLocalization?.translate('current.language')}'),
            ],
          ),
        ),
      ),
    );
  }
}
