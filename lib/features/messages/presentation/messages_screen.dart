import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: Text('الرسائــل',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(5, (index) => Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('asset/images/profile_pic.jpg',width: 50,height: 50,),
                      ),
                      SizedBox(width: 5,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('إسلام عادل',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                          Text('2024/12/12',style: TextStyle(color: Colors.grey),),
                        ],
                      )
                    ],
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 340),
                    child: Text(' السلام عليكم ورحمة الله أقبل قمرك بعد غياب للجنة فتحت أبواب بهجة قلبي صفا روحي رحمة ربي بدون عذاب أهلا أهلا يارمضان ',
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
                  ),
                  SizedBox(height: 5,),
                  Divider(color: Colors.grey.shade200,),
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
