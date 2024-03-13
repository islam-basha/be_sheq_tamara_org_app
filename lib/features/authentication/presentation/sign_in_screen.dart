
import 'package:be_sheq_tamara_org_app/features/authentication/presentation/widgets/sign_in_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../Constants/Color_Constants.dart';
import '../../../common_widgets/default_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:  Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(alignment: Alignment.topRight, child: Image.asset("asset/images/Bubbles.png")),
              Column(
                children: [
                  Image.asset("asset/images/logo.png",width: 133,),
                  //const SizedBox(height: 20,),
                  const Text('حلقة الوصل بينك وبين أي متبرع',style: TextStyle(fontSize: 18,color: secondaryGreen,fontWeight: FontWeight.w500),),
                  const SizedBox(height: 10,),
                  const TextFieldForSinIn(labelText: 'اسم المستخدم', icon: Icons.email, ),
                  const SizedBox(height: 15),
                  const TextFieldForSinIn(labelText: 'كلمة السر', icon: Icons.lock, ),
                  const SizedBox(height: 18),
                  defaultButton(radius: 15, function: (){ context.goNamed('profile');}, text: "تسجيل الدخول",width: 200,height: 50),
                  //const SizedBox(height: 5,),
                ],
              ),
              Align(alignment: Alignment.bottomLeft, child: Image.asset("asset/images/Bubbles2.png")),
            ],
          ),
        ),

    );
  }
}
