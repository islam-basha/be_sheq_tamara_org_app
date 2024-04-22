import 'package:flutter/material.dart';

import '../../../../Constants/Color_Constants.dart';

class EditProfileTextField extends StatelessWidget {
  final TextEditingController labelText;
  final IconData icon;
  final TextInputType inputType;
  final double width;
  final double height;

  const EditProfileTextField({this.width=311,this.height=40,super.key,  required this.labelText, required this.icon , required this.inputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color:mainBeige),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: labelText,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              clipBehavior: Clip.antiAlias,
              keyboardType: inputType,
              style: const TextStyle(fontSize: 14),
              onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: Icon(icon,size: 20,color: const Color(0xffCCCCCC) ,),
                  contentPadding: const EdgeInsets.only(right: 5,bottom: 5)
                //contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
