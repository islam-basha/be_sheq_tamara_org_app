import 'dart:io';
import 'package:be_sheq_tamara_org_app/constants/Color_Constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key});

  @override
  _ImageFieldState createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: double.infinity,
        height: 30,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 5, top: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: mainBeige,
            width: 1,
          ),
        ),
        child: Align(
          alignment: Alignment.topRight,
          child: _image != null
              ? Image.file(
            _image!,
            width: 30,
            height: 30,
            fit: BoxFit.cover,
          )
              : const Icon(Icons.create_new_folder_rounded, color: mainBeige, size: 20,),
        ),
      ),
    );
  }
}