import 'package:flutter/material.dart';

import '../../../../Constants/Color_Constants.dart';

class DonateCategories extends StatelessWidget {
  const DonateCategories(this.cardColor,this.category,{super.key});
  final Color cardColor;
  final int category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(100)
              ),
              child:
              switch(category){
                0 => Image.asset('asset/icons/food-category.png',width: 10,),
                1 => Image.asset('asset/icons/clothes-category.png',width: 10,),
                2 => Image.asset('asset/icons/furniture-category.png',width: 10,),
                3 => Image.asset('asset/icons/medicine-category.png',width: 10,),
                4 => Image.asset('asset/icons/money-category.png',width: 10,),
                _ => const Icon(Icons.not_interested_rounded,color: white,size: 30,)
              }

          ),
          switch(category){
            0 => const Text('طعام',style: TextStyle(fontSize: 12),),
            1 => const Text('ملابس',style: TextStyle(fontSize: 12),),
            2 => const Text('أثاث',style: TextStyle(fontSize: 12),),
            3 => const Text('دواء',style: TextStyle(fontSize: 12),),
            4 => const Text('مال',style: TextStyle(fontSize: 12),),
            _ => const Text('لا يوجد'),
          }
        ],
      ),
    );
  }
}
