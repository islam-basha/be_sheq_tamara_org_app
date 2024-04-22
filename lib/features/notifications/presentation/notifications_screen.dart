import 'package:be_sheq_tamara_org_app/common_widgets/default_button.dart';
import 'package:be_sheq_tamara_org_app/features/notifications/data/accept_donation_repository.dart';
import 'package:be_sheq_tamara_org_app/features/notifications/domain/accept_donations_model.dart';
import 'package:be_sheq_tamara_org_app/features/notifications/domain/pending_donations_model.dart';
import 'package:be_sheq_tamara_org_app/features/notifications/presentation/providers/notifications_provider.dart';
import 'package:be_sheq_tamara_org_app/features/primary/domain/users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../Constants/Color_Constants.dart';
import '../../../app/org_data.dart';
import '../../primary/presentation/providers/users_provider.dart';

String name='';
class Notifications extends ConsumerWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context,ref) {

    var usersDataNotifier = ref.watch(usersNotifier);
    var usersData = ref.read(usersNotifier.notifier);

    final orgIdProvider= ref.read(orgIdNotifier.notifier);
    ref.watch<OrgData>(orgIdNotifier);

    var notificationsDataNotifier = ref.watch(notificationsNotifier(orgIdProvider.orgId));
    var notificationsData = ref.read(notificationsNotifier(orgIdProvider.orgId).notifier);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: const Text('الإشعارات',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            ref.invalidate(notificationsNotifier(orgIdProvider.orgId));
          }, icon:const Icon(Icons.refresh) )
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: notificationsDataNotifier.when(
              data: (_){
                List<PendingDonModel> notifications=notificationsData.notificationsList!;

                return Column(
                    children:
                    List.generate(notifications.length, (index) => Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notifications[index].donDate,style: const TextStyle(color: Colors.grey),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              usersDataNotifier.when(
                                  data: (_){
                                    List<UserModel> users= usersData.usersList!;

                                    for(var user in users){
                                      if(notifications[index].userId==user.id) {
                                        name=user.fullName;
                                      }
                                    }

                                    return Container(
                                      constraints: const BoxConstraints(maxWidth: 330),
                                      child: Text(
                                        'قام $name بالتبرع بـ ${notifications[index].qty}. هل تم استلام التبرع من قبلكم؟ ',
                                        style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                                    );
                                  },
                                  error:(Object error, StackTrace stackTrace) {
                                    return const Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            'حدث خطأ ما! أعِد تحميل الصفحة أو حاول في وقتٍ لاحق.. نعتذر من حضرتك على هذا.',
                                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: secondaryGreen),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  loading: () {
                                    return Center(
                                      child: LoadingAnimationWidget.inkDrop(color: mainGreen, size: 40),
                                    );
                                  })
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              defaultButton(radius: 10, function: ()async{
                                try{
                                  var newDon=
                                  AcceptDonationModel(userId: notifications[index].userId,
                                      orgId: orgIdProvider.orgId, donDate: notifications[index].donDate,
                                      catId: int.parse(notifications[index].catId),
                                      driver: notifications[index].driver,
                                      qty: notifications[index].qty);
                                 await AcceptDonationRepository().acceptDonation(newDon);
                                 await AcceptDonationRepository().deleteDonation(notifications[index].id);
                                  MotionToast.success(
                                    description:  const Text("تم تسجيل هذا التبرع في سجلات المنظمة",textDirection:TextDirection.rtl,),
                                    layoutOrientation: ToastOrientation.rtl,
                                    iconSize: 50,
                                  ).show(context);
                                  ref.invalidate(notificationsNotifier(orgIdProvider.orgId));
                                }catch(e){
                                  print(e);
                                }
                              }, text: 'تم الاستلام',width: 140),
                              const SizedBox(width: 10,),
                              defaultButton(radius: 10, function: () async{
                                try {
                                 await  AcceptDonationRepository().deleteDonation(notifications[index].id);
                                  MotionToast.delete(
                                    padding: const EdgeInsets.all(2),
                                    description:  const Text("تم تأكيد عدم استقبال هذا التبرع وسيتم حذفه",textDirection:TextDirection.rtl,),
                                    layoutOrientation: ToastOrientation.rtl,
                                    iconSize: 50,
                                  ).show(context);
                                 ref.invalidate(notificationsNotifier(orgIdProvider.orgId));
                                }catch(e){
                                  print(e);
                                }
                              }, text: 'إلغاء',background: Colors.redAccent,width: 90),
                            ],
                          ),
                          // Divider(color: Colors.grey,height: 2,)
                        ],
                      ),
                    ),)
                );
              },
              error:(Object error, StackTrace stackTrace) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('asset/images/website.png',width: 250,),
                       Container(
                         alignment: Alignment.center,
                        width: 300,
                        child: const Text(
                          'حدث خطأ ما! أعِد تحميل الصفحة أو حاول في وقتٍ لاحق.. نعتذر من حضرتك على هذا.',
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: secondaryGreen),
                        ),
                      ),
                    ],
                  ),
                );
              },
              loading: () {
                return Center(
                  child: LoadingAnimationWidget.discreteCircle(color: mainGreen, size: 40),
                );
              })


        ),
      ),
    );
  }
}
