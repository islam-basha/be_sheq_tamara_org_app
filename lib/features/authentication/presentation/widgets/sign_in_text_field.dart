import 'package:flutter/material.dart';

class TextFieldForSinIn extends StatelessWidget {
  final String labelText;
  final IconData icon;

  const TextFieldForSinIn({super.key,  required this.labelText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311,
      height: 43,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xfffdda15e)),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: labelText,
                suffixIcon: Icon(icon,size: 20,color:const Color(0xffCCCCCC),),
                hintStyle: const TextStyle(color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}