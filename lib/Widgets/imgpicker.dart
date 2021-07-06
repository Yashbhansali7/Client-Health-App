import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class LoginImgpicker extends StatefulWidget {
  LoginImgpicker(this.imageFnc);
  final Function(File pickedImg) imageFnc;
  @override
  _LoginImgpickerState createState() => _LoginImgpickerState();
}

class _LoginImgpickerState extends State<LoginImgpicker> {
  File _pickedImage;
  void _pickImg(ImageSource img) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    widget.imageFnc(pickedImageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          child: _pickedImage != null ? null : Icon(Icons.add),
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage) : null,
          radius: 40,
        ),
        TextButton.icon(
            onPressed: () => _pickImg(ImageSource.camera),
            icon: Icon(Icons.add_a_photo),
            label: Text('Click Profile Photo')),
        TextButton.icon(
            onPressed: () => _pickImg(ImageSource.gallery),
            icon: Icon(Icons.upload_outlined),
            label: Text('Choose a Profile Photo')),
      ],
    );
  }
}
