import 'package:be_sheq_tamara_org_app/common_widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../Constants/Color_Constants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});


  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int driverIndex=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 140,
                  height: 140,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 1,color: mainGreen),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade300,blurRadius:10,offset: const Offset(0, 5) )
                    ]
                  ),
                  child: const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('asset/images/haya.png')
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              const Center(child: Text('منظمة حياة لدعم مرضى السرطان',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on_outlined,color: mainGreen,),
                  Text('طرابلس - حي الأندلس',style: TextStyle(fontSize: 16),)
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    padding: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1,color: mainGreen)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('21 حملة', style: TextStyle(fontSize: 14),),
                        Image.asset('asset/icons/advertising.png',width: 50,),
                      ],
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    padding: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1,color: mainGreen)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('300 تبرع', style: TextStyle(fontSize: 14),),
                        Image.asset('asset/icons/list.png',width: 50,),
                      ],
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    padding: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1,color: mainGreen)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('2 منشور', style: TextStyle(fontSize: 14),),
                        Image.asset('asset/icons/blog.png',width: 50,),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              Center(
                child: GestureDetector(
                  onTap:(){
                    context.pushNamed('edit_profile');
                  },
                  child: Container(
                    width: 300,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: mainGreen
                    ),
                    child: const Text('تعديل بيانات المنظمة',style: TextStyle(
                      fontSize: 18,color: Colors.white,
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
