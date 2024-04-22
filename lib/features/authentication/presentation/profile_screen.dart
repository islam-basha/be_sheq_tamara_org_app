import 'package:be_sheq_tamara_org_app/app/core/api/end_points.dart';
import 'package:be_sheq_tamara_org_app/common_widgets/app_bar.dart';
import 'package:be_sheq_tamara_org_app/features/authentication/domain/organization_model.dart';
import 'package:be_sheq_tamara_org_app/features/authentication/presentation/providers/all_orgs_provider.dart';
import 'package:be_sheq_tamara_org_app/features/authentication/presentation/providers/pars_num_provider.dart';
import 'package:be_sheq_tamara_org_app/features/authentication/presentation/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../Constants/Color_Constants.dart';
import '../../../app/org_data.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});


  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  int driverIndex=1;
  @override
  Widget build(BuildContext context) {

    final orgIdProvider= ref.read(orgIdNotifier.notifier);
    ref.watch<OrgData>(orgIdNotifier);

    var allOrgsDataNotifier = ref.watch(allOrgsNotifier);
    var allOrgsData = ref.read(allOrgsNotifier.notifier);

    var parsNumDataNotifier = ref.watch(parsNumNotifier);
    var parsNumData = ref.read(parsNumNotifier.notifier);

    return Scaffold(
      appBar: const MyAppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: allOrgsDataNotifier.when(
              data: (_){
                List<OrganizationModel> orgs=allOrgsData.OrgsList!;

                OrganizationModel profile = orgs.firstWhere(
                      (org) => org.id == orgIdProvider.orgId,);

                return Column(
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
                        child:  CircleAvatar(
                            radius: 100,
                            backgroundImage: NetworkImage(EndPoints.BASEURL+profile.logoImg)
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                     Center(child: Text(profile.orgName,
                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on_outlined,color: mainGreen,),
                        Text(profile.location,style: const TextStyle(fontSize: 16),)
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
                              parsNumDataNotifier.when(
                                  data: (_){
                                    int pars=parsNumData.parsNum!;
                                    return Text(pars.toString()+' مشاركة', style: TextStyle(fontSize: 14),);
                                  },
                                  error: (Object error, StackTrace stackTrace){
                                    return Text('/'+' مشاركة', style: TextStyle(fontSize: 14),);
                                  },
                                  loading:  () {
                                    return Center(
                                      child: LoadingAnimationWidget.threeRotatingDots(color: mainGreen, size: 20),
                                    );
                                  }
                              ),
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
                    const SizedBox(height: 15,),
                    Text(profile.orgDec,style: const TextStyle(fontSize: 16),)
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
          ),

        ),
      ),
    );
  }
}
