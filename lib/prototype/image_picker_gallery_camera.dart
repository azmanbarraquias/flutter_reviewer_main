import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: ImageGalleryCamPicker(),
    ),
  ));
}

class ImageGalleryCamPicker extends StatefulWidget {
  File? _selectedImage;

  ImageGalleryCamPicker({super.key});

  @override
  State<ImageGalleryCamPicker> createState() => _ImageGalleryCamPickerState();
}

class _ImageGalleryCamPickerState extends State<ImageGalleryCamPicker> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blue)),
            onPressed: _pickImageFromGallery,
            child: const Text("Pick Image From Gallery"),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.red)),
            onPressed: _pickImageFromCamera,
            child: const Text("Pick Image From Camera"),
          ),
          const SizedBox(
            height: 20,
          ),
          _selectedImage != null
              ? Image.file(
                  _selectedImage!,
                  height: 300,
                )
              : const Text("Please select an Image")
        ],
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }
}
