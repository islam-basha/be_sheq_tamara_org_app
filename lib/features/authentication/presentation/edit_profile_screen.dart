import 'package:be_sheq_tamara_org_app/features/authentication/presentation/providers/all_orgs_provider.dart';
import 'package:be_sheq_tamara_org_app/features/authentication/presentation/widgets/clip_profile_image.dart';
import 'package:be_sheq_tamara_org_app/features/authentication/presentation/widgets/edit_profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../Constants/Color_Constants.dart';
import '../../../app/core/api/end_points.dart';
import '../../../app/org_data.dart';
import '../../../common_widgets/default_button.dart';
import '../domain/organization_model.dart';

class EditProfile extends ConsumerStatefulWidget {
  const EditProfile({super.key});

  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {

  Color maleColor=mainBeige;
  Color maleColorTxt=white;
  Color femaleColor=white;
  Color femaleColorTxt=Colors.grey;
  bool male=true;

  TextEditingController nameController=TextEditingController();
  TextEditingController descController=TextEditingController();
  TextEditingController userNameController=TextEditingController();
  TextEditingController passController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController addController=TextEditingController();
  TextEditingController gooController=TextEditingController();
  TextEditingController pa1Controller=TextEditingController();
  TextEditingController pa2Controller=TextEditingController();
  TextEditingController pa3Controller=TextEditingController();

  @override
  Widget build(BuildContext context) {

    final orgIdProvider= ref.read(orgIdNotifier.notifier);
    ref.watch<OrgData>(orgIdNotifier);

    var allOrgsDataNotifier = ref.watch(allOrgsNotifier);
    var allOrgsData = ref.read(allOrgsNotifier.notifier);

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
            child:allOrgsDataNotifier.when(
                data: (_){
                  List<OrganizationModel> orgs=allOrgsData.OrgsList!;

                  OrganizationModel profile = orgs.firstWhere(
                        (org) => org.id == orgIdProvider.orgId,);

                  nameController.text=profile.orgName;
                  descController.text=profile.orgDec;
                  userNameController.text=profile.accountName;
                  passController.text=profile.accountPass;
                  addController.text=profile.location;
                  gooController.text=profile.googleLocation;

                  return  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       ClipImage(imagePath: EndPoints.BASEURL+profile.logoImg,),
                      const SizedBox(height: 10,),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                             EditProfileTextField(labelText: nameController, icon: Icons.text_fields,inputType: TextInputType.text,),
                            const SizedBox(height: 10),
                             EditProfileTextField(labelText: descController, icon: Icons.description,inputType: TextInputType.text,height: 120,),
                            const SizedBox(height: 10),
                             EditProfileTextField(labelText: userNameController, icon: Icons.person_sharp,inputType: TextInputType.emailAddress, ),
                            const SizedBox(height: 10),
                             EditProfileTextField(labelText: passController, icon: Icons.lock,inputType: TextInputType.visiblePassword, ),
                            const SizedBox(height: 10),
                             EditProfileTextField(labelText: phoneController, icon: Icons.phone,inputType: TextInputType.phone,),
                            const SizedBox(height: 10),
                             EditProfileTextField(labelText:addController, icon: Icons.location_on ,inputType: TextInputType.text,),
                            const SizedBox(height: 10),
                             EditProfileTextField(labelText: gooController, icon: Icons.location_searching_rounded ,inputType: TextInputType.text,),
                            const SizedBox(height: 20),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('   أوراق المنظمة الثبوثية : ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: secondaryGreen),),
                              ],
                            ),
                            const SizedBox(height: 10),

                             EditProfileTextField(labelText: pa1Controller, icon: Icons.link ,inputType: TextInputType.text,),
                            const SizedBox(height: 10),
                             EditProfileTextField(labelText: pa2Controller, icon: Icons.link ,inputType: TextInputType.text,),
                            const SizedBox(height: 10),
                             EditProfileTextField(labelText: pa3Controller, icon: Icons.link ,inputType: TextInputType.text,),
                            const SizedBox(height: 10),
                            defaultButton(width: 200,radius: 15, function: (){
                              context.goNamed('profile');
                            }, text: "حفظ التعديلات"),
                            const SizedBox(height: 5,),
                          ],
                        ),
                      ),

                    ],
                  );
                },
                error: (Object error, StackTrace stackTrace) {
                  return Center(
                    child: Column(
                      children: [
                        Image.asset('asset/images/website.png'),
                        const Text(
                          'حدث خطأ ما! أعِد تحميل الصفحة أو حاول في وقتٍ لاحق.. نعتذر من حضرتكم على هذا.',
                          style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: secondaryGreen),
                        ),
                      ],
                    ),
                  );
                },
                loading: () {
                  return Center(
                    child: LoadingAnimationWidget.threeRotatingDots(color: mainGreen, size: 40),
                  );
                }
                )


          ),
        ),
      ),
    );
  }
}
