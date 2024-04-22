import 'package:be_sheq_tamara_org_app/features/messages/domain/messages_model.dart';
import 'package:be_sheq_tamara_org_app/features/messages/presentation/providers/message_provider.dart';
import 'package:be_sheq_tamara_org_app/features/messages/presentation/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../Constants/Color_Constants.dart';
import '../../../app/org_data.dart';
import '../../primary/domain/users_model.dart';
import '../../primary/presentation/providers/users_provider.dart';

String _userName='unknown';

class Messages extends ConsumerStatefulWidget {
  const Messages({super.key});

  @override
  ConsumerState<Messages> createState() => _MessagesState();
}

class _MessagesState extends ConsumerState<Messages> {
  @override
  Widget build(BuildContext context) {

    final orgIdProvider= ref.read(orgIdNotifier.notifier);
    ref.watch<OrgData>(orgIdNotifier);

    var messagesDataNotifier = ref.watch(messagesNotifier(orgIdProvider.orgId));
    var messagesData = ref.read(messagesNotifier(orgIdProvider.orgId).notifier);

    var usersDataNotifier = ref.watch(usersNotifier);
    var usersData = ref.read(usersNotifier.notifier);

    return  Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: const Text('الرسائــل',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            ref.invalidate(messagesNotifier(orgIdProvider.orgId));
          }, icon:const Icon(Icons.refresh) )
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child:messagesDataNotifier.when(
              data: (_){
                List<MessageModel> messages=messagesData.messagesList!;
                return usersDataNotifier.when(
                    data: (_){
                      List<UserModel> users=usersData.usersList!;
                      return Column(
                        children: List.generate(messages.length, (index) {
                          for(var user in users){
                            if(messages[index].userId==user.id) {
                              _userName=user.fullName;
                            }
                          }
                         return MessageWidget(name: _userName, date:  messages[index].date, message:  messages[index].msg);
                        }
                        ),
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
