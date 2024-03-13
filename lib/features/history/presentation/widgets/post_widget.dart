import 'package:flutter/material.dart';

import '../../../../Constants/Color_Constants.dart';
import '../../../../common_widgets/default_button.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 38.0, right: 38),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                "asset/images/newsImage1.png",
                width: 312,
                height: 200,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "طلب تبرع | قصة نجاح ",
                  style: TextStyle(fontSize: 14, color: secondaryBeige),
                ),
                Text(" 2023/12/29 ",
                    style: TextStyle(
                        fontSize: 14, color: Color(0xff95989A))),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.topRight,
                child: Text(
                  "من أنجح الوسائل التعليمية سؤالٌ وجواب",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14,color: secondaryGreen),
                )),
            Text("اسألوا أطفالكم، ثم ادعموهم بالأجوبة الصحيحة بعد طباعتكم للصور وانشروا الخير واحتسِبوا أجور تعليم النّشأ!",style: TextStyle(fontSize: 14,),),
            Align(
              alignment: Alignment.bottomLeft,
              child: GestureDetector(
                  child: const Text(
                    "قراءة المزيد",
                    style: TextStyle( fontSize: 14,color: secondaryBeige),
                  )),
            ),
            defaultButton(radius: 10, function: (){}, text: 'حذف',background: Colors.redAccent,width: 90),
            Divider(color: Colors.grey.shade300,)
          ],
        ),
      ),
    );
  }
}
