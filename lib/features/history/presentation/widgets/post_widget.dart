import 'package:flutter/material.dart';

import '../../../../Constants/Color_Constants.dart';
import '../../../../common_widgets/default_button.dart';

class Posts extends StatelessWidget {
  const Posts({required this.post_image,required this.post_title,required this.post_text,required this.post_date,super.key});
  final String post_image;
  final String post_title;
  final String post_date;
  final String post_text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 38.0, right: 38),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                height: 200,
                width: 300,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Image.network(
                  post_image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  post_title,
                  style: TextStyle(fontSize: 14, color: secondaryBeige),
                ),
                Text(post_date,
                    style: TextStyle(
                        fontSize: 14, color: Color(0xff95989A))),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(post_text,style: TextStyle(fontSize: 14,),),
            defaultButton(radius: 10, function: (){}, text: 'حذف',background: Colors.redAccent,width: 90),
            Divider(color: Colors.grey.shade300,)
          ],
        ),
      ),
    );
  }
}
