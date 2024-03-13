import 'package:flutter/material.dart';
import '../../../../common_widgets/default_button.dart';

class Campaigns extends StatelessWidget {
  const Campaigns({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 308,
      height: 280,
      margin: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0,left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Image.asset("asset/images/comp1.png", width: 280, height: 180),
            ),
            Text("شن الّي ماتعرفاش عن مرض السّرطان؟", style: TextStyle(fontSize: 12)),
            Text("حوارية توعوية", style: TextStyle(fontSize: 10)),
            SizedBox(height: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("asset/icons/location.png", width: 10, height: 10),
                Text("فندق رديسون بلو", style: TextStyle(fontSize: 10,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset("asset/icons/calender.png", width: 10, height: 10),
                    Text("يوم الجمعة من 5 إلى 9 مساء", style: TextStyle(fontSize: 10,)),
                  ],
                ),
                defaultButton(radius: 10, function: (){}, text: 'حذف',background: Colors.redAccent,width: 90,height: 30),
              ],
            ),
            SizedBox(height: 5,)
          ],
        ),
      ),
    );
  }
}
