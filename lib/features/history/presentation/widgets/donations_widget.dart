import 'package:flutter/material.dart';

import '../../../../Constants/Color_Constants.dart';

class Donations extends StatelessWidget {
  const Donations({required this.donId,required this.donName,required this.donType,required this.donQty,required this.donDate,super.key});
  final String donId;
  final String donName;
  final String donType;
  final String donQty;
  final String donDate;

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
                  Text('رقم التبرع : ',style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text(donId,style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
                ],
              ),
              Row(
                children: [
                  Text('من : ',style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text(donName,style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
                ],
              ),
              Row(
                children: [
                  Text('نوع التبرع : ',style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text(donType,style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
                ],
              ),
              Row(
                children: [
                  Text('كمية التبرع : ',style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text(donQty,style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
                ],
              ),
              Row(
                children: [
                  Text('تاريخ التبرع : ',style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                  Text(donDate,style:  TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
                ],
              ),

            ],
          ),
          Image.asset('asset/icons/donate.png',width: 50,)
        ],
      ),
    ) ;
  }
}
