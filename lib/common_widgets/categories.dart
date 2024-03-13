import 'package:flutter/cupertino.dart';

import '../Constants/Color_Constants.dart';
    
class Categories extends StatelessWidget {
  const Categories({super.key, required this.txt});

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: mainBeige,
          borderRadius: BorderRadius.circular(100)
      ),
      child: Image.asset(txt,width: 10,),
    );
  }
}

