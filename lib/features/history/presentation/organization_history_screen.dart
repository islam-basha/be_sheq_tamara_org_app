import 'package:be_sheq_tamara_org_app/app/core/api/end_points.dart';
import 'package:be_sheq_tamara_org_app/common_widgets/app_bar.dart';
import 'package:be_sheq_tamara_org_app/features/history/data/history_repository.dart';
import 'package:be_sheq_tamara_org_app/features/history/domain/campaigns_model.dart';
import 'package:be_sheq_tamara_org_app/features/history/domain/donations_model.dart';
import 'package:be_sheq_tamara_org_app/features/history/domain/participations_model.dart';
import 'package:be_sheq_tamara_org_app/features/history/domain/posts_model.dart';
import 'package:be_sheq_tamara_org_app/features/history/presentation/providers/campaigns_provider.dart';
import 'package:be_sheq_tamara_org_app/features/history/presentation/providers/donations_provider.dart';
import 'package:be_sheq_tamara_org_app/features/history/presentation/providers/participations_provider.dart';
import 'package:be_sheq_tamara_org_app/features/history/presentation/providers/posts_provider.dart';
import 'package:be_sheq_tamara_org_app/features/history/presentation/widgets/campaign_widget.dart';
import 'package:be_sheq_tamara_org_app/features/history/presentation/widgets/donations_widget.dart';
import 'package:be_sheq_tamara_org_app/features/history/presentation/widgets/participation_widget.dart';
import 'package:be_sheq_tamara_org_app/features/history/presentation/widgets/post_widget.dart';
import 'package:be_sheq_tamara_org_app/features/primary/domain/users_model.dart';
import 'package:be_sheq_tamara_org_app/features/primary/presentation/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../../Constants/Color_Constants.dart';
import '../../../app/org_data.dart';

int _index=1;
String _userName='unknown';
String _category='unknown';
class OrganizationHistory extends ConsumerStatefulWidget {
  const OrganizationHistory({super.key});

  @override
  ConsumerState<OrganizationHistory> createState() => _DonationsHistoryState();
}

class _DonationsHistoryState extends ConsumerState<OrganizationHistory> {
  @override
  Widget build(BuildContext context) {

    final orgIdProvider= ref.read(orgIdNotifier.notifier);
    ref.watch<OrgData>(orgIdNotifier);

    var postsDataNotifier = ref.watch(postsNotifier(orgIdProvider.orgId));
    var postsData = ref.read(postsNotifier(orgIdProvider.orgId).notifier);

    var partsDataNotifier = ref.watch(participationsNotifier(orgIdProvider.orgId));
    var partsData = ref.read(participationsNotifier(orgIdProvider.orgId).notifier);

    var donationsDataNotifier = ref.watch(donationsNotifier(orgIdProvider.orgId));
    var donationsData = ref.read(donationsNotifier(orgIdProvider.orgId).notifier);

    var campsDataNotifier = ref.watch(campaignsNotifier(orgIdProvider.orgId));
    var campsData = ref.read(campaignsNotifier(orgIdProvider.orgId).notifier);

    var usersDataNotifier = ref.watch(usersNotifier);
    var usersData = ref.read(usersNotifier.notifier);

    return Scaffold(
      appBar: const MyAppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _index=1;
                          });
                          ref.invalidate(donationsNotifier(orgIdProvider.orgId));
                        },
                        child: Container(
                          width: 160,
                          height: 60,
                          padding: const EdgeInsets.all(2.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1,color: mainGreen)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('عدد التبرعات :', style: TextStyle(fontSize: 14),),
                                  donationsDataNotifier.when(
                                      data: (_){
                                        String _num=donationsData.donationsList!.length.toString();
                                       return  Text(_num+' تبرع', style: TextStyle(fontSize: 14),);
                                      },
                                      error: (Object error, StackTrace stackTrace){
                                        return Text('/'+' تبرع', style: TextStyle(fontSize: 14),);
                                      },
                                      loading:  () {
                                        return Center(
                                          child: LoadingAnimationWidget.threeRotatingDots(color: mainGreen, size: 20),
                                        );
                                      }
                                      ),
                                ],
                              ),
                              Image.asset('asset/icons/list.png',width: 40,),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _index=2;
                          });
                          ref.invalidate(participationsNotifier(orgIdProvider.orgId));
                        },
                        child: Container(
                          width: 160,
                          height: 60,
                          padding: const EdgeInsets.all(2.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1,color: mainGreen)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('عدد المشاركات :', style: TextStyle(fontSize: 14),),
                                  partsDataNotifier.when(
                                      data: (_){
                                        if(partsData.participationsList==null){
                                          return Text('0 مشاركة', style: TextStyle(fontSize: 14),);
                                        }else{
                                          String _num=partsData.participationsList!.length.toString();
                                          return Text(_num+' مشاركة', style: TextStyle(fontSize: 14),);
                                        }

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

                                ],
                              ),
                              Image.asset('asset/icons/raise-hand.png',width: 40,),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _index=3;
                          });
                          ref.invalidate(postsNotifier(orgIdProvider.orgId));
                        },
                        child: Container(
                          width: 160,
                          height: 60,
                          padding: const EdgeInsets.all(2.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1,color: mainGreen)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('عدد المنشورات :', style: TextStyle(fontSize: 14),),
                                  postsDataNotifier.when(
                                      data: (_){
                                        String _num=postsData.postsList!.length.toString();
                                        return   Text(_num+'  منشور', style: TextStyle(fontSize: 14),);
                                      },
                                      error: (Object error, StackTrace stackTrace){
                                        return Text('/'+' منشور', style: TextStyle(fontSize: 14),);
                                      },
                                      loading:  () {
                                        return Center(
                                          child: LoadingAnimationWidget.threeRotatingDots(color: mainGreen, size: 20),
                                        );
                                      }
                                  ),
                                ],
                              ),
                              Image.asset('asset/icons/blog.png',width: 40,),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            _index=4;
                          });
                          ref.invalidate(campaignsNotifier(orgIdProvider.orgId));
                        },
                        child: Container(
                          width: 160,
                          height: 60,
                          padding: const EdgeInsets.all(2.5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 1,color: mainGreen)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('عدد الحملات :', style: TextStyle(fontSize: 14),),
                                  campsDataNotifier.when(data: (_){
                                    String _num=campsData.campaignsList!.length.toString();
                                    return   Text(_num+'  حملة', style: TextStyle(fontSize: 14),);
                                  },
                                      error: (Object error, StackTrace stackTrace){
                                        return Text('/'+' منشور', style: TextStyle(fontSize: 14),);
                                      },
                                      loading:  () {
                                        return Center(
                                          child: LoadingAnimationWidget.threeRotatingDots(color: mainGreen, size: 20),
                                        );
                                      }
                                      ),
                                ],
                              ),
                              Image.asset('asset/icons/advertising.png',width: 40,),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),

                  if(_index==1)
                    donationsDataNotifier.when(
                        data: (_){
                          List<DonationModel> donations=donationsData.donationsList!;
                          return usersDataNotifier.when(
                              data: (_){
                                List<UserModel> users=usersData.usersList!;
                                return Wrap(
                                  children: List.generate(donations.length, (index) {
                                    for(var user in users){
                                      if(donations[index].userId==user.id)
                                        _userName=user.fullName;
                                    }
                                    if(donations[index].catId==1)
                                      _category='طعام';
                                    if(donations[index].catId==2)
                                      _category='ملابس';
                                    if(donations[index].catId==3)
                                      _category='أثاث';
                                    if(donations[index].catId==4)
                                      _category='دواء';
                                    if(donations[index].catId==5)
                                      _category='مال';
                                    return  Donations(donId: donations[index].id,
                                        donName: _userName,
                                        donType: _category,
                                        donQty: donations[index].qty,
                                        donDate: donations[index].donDate);
                                  }
                                  ),
                                );

                              }, error:  (Object error, StackTrace stackTrace){return Text('//');},
                              loading: (){
                                return Center(
                                  child: LoadingAnimationWidget.threeRotatingDots(color: mainGreen, size: 20),
                                );
                              }
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


                  if(_index==2)
                    partsDataNotifier.when(
                        data: (_){
                          if(partsData.participationsList==null){
                            return Container();
                          }else{
                            List<ParticipationModel> parts=partsData.participationsList!;
                            return Wrap(
                              children: List.generate(parts.length, (index) =>
                                  Participations(parId: parts[index].participationId, parName: parts[index].userName,
                                      campName: parts[index].campName, campDate: parts[index].campDate)
                              ),
                            );
                          }
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

                  if(_index==3)
                    postsDataNotifier.when(
                        data: (_){
                          List<PostModel> posts=postsData.postsList!;
                          return Wrap(
                            children: List.generate(posts.length, (index) =>
                                Posts(post_title: posts[index].postTitle, post_text: posts[index].postText,
                                  post_image:EndPoints.BASEURL+posts[index].image,post_date: posts[index].date,
                                function: () async{
                                  try{
                                    await HistoryRepository().deletePost(posts[index].id);
                                    MotionToast.delete(
                                      description:  const Text("تمت عملية الحذف بنجاح",textDirection:TextDirection.rtl,),
                                      layoutOrientation: ToastOrientation.rtl,
                                      iconSize: 50,
                                    ).show(context);
                                    ref.invalidate(postsNotifier(orgIdProvider.orgId));
                                  }catch(e){
                                    print(e);
                                  }
                                },)),
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

                  if(_index==4)
                    campsDataNotifier.when(
                        data: (_){
                          List<CampaignModel> campaigns=campsData.campaignsList!;
                          return Wrap(
                            children: List.generate(campaigns.length, (index) =>
                                Campaigns(image_url: EndPoints.BASEURL+campaigns[index].campImage,title:campaigns[index].campTitle,
                                desc: campaigns[index].campDec,location: campaigns[index].location,date: campaigns[index].startDate,
                                   function:  () async{
                                  try{
                                    await HistoryRepository().deleteCamp(campaigns[index].id);
                                    MotionToast.delete(
                                      description:  const Text("تمت عملية الحذف بنجاح",textDirection:TextDirection.rtl,),
                                      layoutOrientation: ToastOrientation.rtl,
                                      iconSize: 50,
                                    ).show(context);
                                    ref.invalidate(campaignsNotifier(orgIdProvider.orgId));
                                  }catch(e){
                                    print(e);
                                  }
                                   },)),
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
                ],
              ),
        ),
      ),
    );
  }
}
