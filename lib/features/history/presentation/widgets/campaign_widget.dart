import 'package:flutter/material.dart';
import '../../../../common_widgets/default_button.dart';

class Campaigns extends StatelessWidget {
  const Campaigns({required this.image_url,required this.title,required this.desc,required this.location,required this.date,super.key});
  final String image_url;
  final String title;
  final String desc;
  final String location;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                height: 250,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Image.network(image_url,fit: BoxFit.fill,)),
            const SizedBox(height: 5,),
            Text(title, style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w600)),
            Text(desc, style: const TextStyle(fontSize: 10)),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("asset/icons/location.png", width: 10, height: 10),
                Text(location, style: const TextStyle(fontSize: 10,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset("asset/icons/calender.png", width: 10, height: 10),
                    Text(date, style: const TextStyle(fontSize: 10,)),
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
