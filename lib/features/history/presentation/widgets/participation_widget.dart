import 'package:flutter/material.dart';

import '../../../../Constants/Color_Constants.dart';

class Participations extends StatelessWidget {
  const Participations({required this.parId,required this.parName,required this.campName,required this.campDate,super.key});

  final String parId;
  final String parName;
  final String campName;
  final String campDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: mainBeige),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('رقم المشاركة : ',style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text(parId,style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
                ],
              ),
              Row(
                children: [
                  Text('الاسم : ',style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text(parName,style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
                ],
              ),
              Row(
                children: [
                  Text('اسم الحملة : ',style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text(campName,style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
                ],
              ),
              Row(
                children: [
                  Text('تاريخ الحملة : ',style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text(campDate,style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
                ],
              ),
            ],
          ),
          Image.asset('asset/icons/fight.png',width: 50,)
        ],
      ),
    ) ;
  }
}
