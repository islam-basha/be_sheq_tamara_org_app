import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../Constants/Color_Constants.dart';
import '../../../common_widgets/default_button.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            color: mainBeige,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('asset/images/Charity-rafiki.png',width: 400,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(right: 20,left: 20,bottom:50),
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("asset/images/logo.png",width: 150,),
                        const Text('تطبيق بـ شق تمرة للمنظمات',style: TextStyle(fontSize: 18,color: secondaryGreen,fontWeight: FontWeight.w500),),
                        const SizedBox(height: 10,),
                        Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            defaultButton(radius: 15, function: (){
                              context.pushNamed('sign_in');
                            },
                                size: 16, text: "إبدأ الآن",width: 200,height: 48),
                          ],
      
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
      
      ),
    );
  }
}
