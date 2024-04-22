
import 'package:be_sheq_tamara_org_app/features/authentication/data/profile_repository.dart';
import 'package:be_sheq_tamara_org_app/features/authentication/presentation/providers/all_orgs_provider.dart';
import 'package:be_sheq_tamara_org_app/features/authentication/presentation/widgets/sign_in_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../../Constants/Color_Constants.dart';
import '../../../app/org_data.dart';
import '../../../common_widgets/default_button.dart';

class OrgSignIn{
  String accountName;
  String accountPass;
  OrgSignIn(this.accountName,this.accountPass);
}

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  TextEditingController nameController=TextEditingController();
  TextEditingController passController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final orgIdProvider= ref.read(orgIdNotifier.notifier);
    ref.watch<OrgData>(orgIdNotifier);

    var allOrgsDataNotifier = ref.watch(allOrgsNotifier);
    var allOrgsData = ref.read(allOrgsNotifier.notifier);

    return  Scaffold(
      resizeToAvoidBottomInset: false,
        body:  Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(alignment: Alignment.topRight, child: Image.asset("asset/images/Bubbles.png")),
              Column(
                children: [
                  Image.asset("asset/images/logo.png",width: 133,),
                  const Text('حلقة الوصل بينك وبين أي متبرع',style: TextStyle(fontSize: 18,color: secondaryGreen,fontWeight: FontWeight.w500),),
                  const SizedBox(height: 10,),
                   TextFieldForSinIn(controller:nameController,labelText: 'اسم المستخدم', icon: Icons.email, ),
                  const SizedBox(height: 15),
                   TextFieldForSinIn(controller:passController,labelText: 'كلمة السر', icon: Icons.lock, ),
                  const SizedBox(height: 18),
                  defaultButton(radius: 15, function: (){
                    if(nameController.text.isEmpty || passController.text.isEmpty){
                      MotionToast.warning(
                        padding: const EdgeInsets.all(2),
                        title:  const Text("تنبيه"),
                        description:  const Align(
                            alignment: Alignment.centerRight,
                            child: Text("'يرجى تعبئة كافة الحقول لتتمكن من تسجيل الحقولً",textDirection:TextDirection.rtl,)),
                        layoutOrientation: ToastOrientation.rtl,
                        iconSize: 50,
                      ).show(context);
                    }else{
                      var signIn=
                      ProfileRepository().showFutureProfile(
                          nameController.text, passController.text);
                      if(signIn==null){
                        MotionToast.error(
                          padding: const EdgeInsets.all(2),
                          description:  const Align(
                              alignment: Alignment.centerRight,
                              child: Text("المستخدم غير موجود!",textDirection:TextDirection.rtl,)),
                          layoutOrientation: ToastOrientation.rtl,
                          iconSize: 50,
                        ).show(context);
                      }else{
                        String id='';
                        for(var org in allOrgsData.OrgsList!){
                          if(org.accountName==nameController.text){
                            id=org.id;
                          }
                        }
                        orgIdProvider.setOrg(id);
                        context.goNamed('profile');
                      }

                    }
                    }, text: "تسجيل الدخول",width: 200,height: 50),
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
