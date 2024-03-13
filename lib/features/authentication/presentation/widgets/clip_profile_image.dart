import 'dart:io';
import 'package:be_sheq_tamara_org_app/constants/Color_Constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ClipImage extends StatefulWidget {
  const ClipImage({super.key});

  @override
  _ClipImageState createState() => _ClipImageState();
}

class _ClipImageState extends State<ClipImage> {
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Center(
            child: InkWell(
              onTap: _getImage,
              child: Container(
                width: 140,
                height: 140,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 1,color: mainBeige),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300,blurRadius:10,offset: const Offset(0, 5) )
                    ]
                ),
                child: const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('asset/images/haya.png')
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70.0),
            child: Center(child: Container( width:31,height:31,
                decoration: BoxDecoration(
                  color:mainGreen,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(Icons.add,size: 30,color: Colors.white,))),
          ),

        ] );
  }
}