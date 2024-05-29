import 'package:flutter/material.dart';

import '../dart_coding_practice/dart_main.dart';
import 'src/widget_with_codeview.dart';

void main() {
  runApp(const MyApp());
}

/// ! Ensure the files in [filePath] are included in pubspec.yaml
/// In this example the codeViewer will display this file's code
/// by pointing to the main.dart file
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: WidgetWithCodeView(
            headerWidget: const Text('Test'),
            filePath: 'lib/template/template_lite.dart',

            /// [codeLinkPrefix] is optional. When it's specified, two more buttons
            /// (open-code-in-browser, copy-code-link) will be added in the code view.
            codeLinkPrefix:
                'https://github.com/azmanbarraquias/dev_azuma_flutter_project_reviewer/blob/master/lib/main.dart',
            labelBackgroundColor: Theme.of(context).canvasColor,
            labelTextStyle: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color),
            showLabelText: true,
            child: const MyPage(),
          ),
        ),
      ),
    );
  }
}
