import 'package:be_sheq_tamara_org_app/common_widgets/default_button.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: Text('الإشعارات',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children:
            List.generate(1, (index) => Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('2024/3/13',style: TextStyle(color: Colors.grey),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Text('قام عبدالمولى القماطي بالتبرع بقيمة 25 دينار عن طريق السائق المتطوع مروان الخولي.',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                        constraints: BoxConstraints(maxWidth: 330),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      defaultButton(radius: 10, function: (){}, text: 'تم الاستلام',width: 140),
                      SizedBox(width: 10,),
                      defaultButton(radius: 10, function: (){}, text: 'إلغاء',background: Colors.redAccent,width: 90),
                    ],
                  ),
                  // Divider(color: Colors.grey,height: 2,)
                ],
              ),
            ),)
          ),
        ),
      ),
    );
  }
}
