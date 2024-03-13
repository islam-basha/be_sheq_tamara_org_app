import 'package:be_sheq_tamara_org_app/features/authentication/presentation/widgets/clip_profile_image.dart';
import 'package:be_sheq_tamara_org_app/features/authentication/presentation/widgets/edit_profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../Constants/Color_Constants.dart';
import '../../../common_widgets/default_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  Color maleColor=mainBeige;
  Color maleColorTxt=white;
  Color femaleColor=white;
  Color femaleColorTxt=Colors.grey;
  bool male=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor:Colors.grey.shade100 ,
        iconTheme: const IconThemeData(color: secondaryBeige),
      ),
      body:  Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ClipImage(),
                const SizedBox(height: 10,),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const EditProfileTextField(labelText: 'منظمة حياة لدعم المرضى', icon: Icons.text_fields,inputType: TextInputType.text,),
                      const SizedBox(height: 10),
                      const EditProfileTextField(labelText: 'منظمة حياة لدعم المرضى', icon: Icons.description,inputType: TextInputType.text,height: 120,),
                      const SizedBox(height: 10),
                      const EditProfileTextField(labelText: 'اسم المستخدم', icon: Icons.person_sharp,inputType: TextInputType.emailAddress, ),
                      const SizedBox(height: 10),
                      const EditProfileTextField(labelText: 'كلمة السر', icon: Icons.lock,inputType: TextInputType.visiblePassword, ),
                      const SizedBox(height: 10),
                      const EditProfileTextField(labelText: 'رقم الهاتف', icon: Icons.phone,inputType: TextInputType.phone,),
                      const SizedBox(height: 10),
                      const EditProfileTextField(labelText: 'العنوان', icon: Icons.location_on ,inputType: TextInputType.text,),
                      const SizedBox(height: 10),
                      const EditProfileTextField(labelText: 'رابط موقعك على خرائط قوقل', icon: Icons.location_searching_rounded ,inputType: TextInputType.text,),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('   أوراق المنظمة الثبوثية : ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: secondaryGreen),),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const EditProfileTextField(labelText: 'hgrtygfrtyhgf@oljfkhdjkh356vfmklmkmdc4', icon: Icons.link ,inputType: TextInputType.text,),
                      const SizedBox(height: 10),
                      const EditProfileTextField(labelText: 'hgrtygfrtyhgf@oljfkhdjkh356vfmklmkmdc4', icon: Icons.link ,inputType: TextInputType.text,),
                      const SizedBox(height: 10),
                      const EditProfileTextField(labelText: 'hgrtygfrtyhgf@oljfkhdjkh356vfmklmkmdc4', icon: Icons.link ,inputType: TextInputType.text,),
                      const SizedBox(height: 10),
                      defaultButton(width: 200,radius: 15, function: (){
                        context.goNamed('profile');
                      }, text: "حفظ التعديلات"),
                      const SizedBox(height: 5,),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
