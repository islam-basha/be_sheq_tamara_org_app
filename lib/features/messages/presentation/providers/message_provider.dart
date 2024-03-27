import 'dart:async';

import 'package:be_sheq_tamara_org_app/features/messages/data/message_repository.dart';
import 'package:be_sheq_tamara_org_app/features/messages/domain/messages_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessagesNotifier extends AutoDisposeAsyncNotifier{

  Object? key;
  List<MessageModel>? messagesList;
  String org_id='org101';

  @override
  FutureOr build() {
    key = Object();
    ref.onDispose(() {
      key = null;
    });
    return showParticipations();
  }

  Future showParticipations(
      ) async {
    state = const AsyncValue.loading();
    final key = this.key;
    messagesList = await MessagesRepository().showFutureOrgMessages(org_id);
    if (key != this.key) {
      return null;
    }
    state = AsyncValue.data(messagesList);

    return state.value;
  }

}
final messagesNotifier = AutoDisposeAsyncNotifierProvider(MessagesNotifier.new);
