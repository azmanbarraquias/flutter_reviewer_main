import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  final title = 'MyPage';

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          // Start Here
          child: Column(
            children: [
              Image.asset('assets/deep_quiz_img.png'),
              ElevatedButton(
                onPressed: () async {
                  const urlImage = "https://images.unsplash.com/photo-1619980296991-5c0d64b23950?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80";
                  final url = Uri.parse(urlImage);
                  final response = await http.get(url);
                  final bytes = response.bodyBytes;

                  final temp = await getTemporaryDirectory();
                  final path = "${temp.path}/image.jpg";
                  File(path).writeAsBytesSync(bytes);
                  await Share.shareXFiles([XFile(path)],
                      text: "Picture of Beautiful Puppy").then((status) {
                        print('${status.status}');
                  });
                },
                child: const Text('Share'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void printDirectoryPaths() async {
    String tempPath = await getTempDirectoryPath();
    print('Temporary Directory Path: $tempPath');

    String appDocsPath = await getAppDocumentsDirectoryPath();
    print('Application Documents Directory Path: $appDocsPath');

    String? externalPath = await getExternalStorageDirectoryPath();
    if (externalPath != null) {
      print('External Storage Directory Path: $externalPath');
    }
  }

  Future<String> getTempDirectoryPath() async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  Future<String?> getExternalStorageDirectoryPath() async {
    final directory = await getExternalStorageDirectory();
    return directory?.path;
  }

  Future<String> getAppDocumentsDirectoryPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
