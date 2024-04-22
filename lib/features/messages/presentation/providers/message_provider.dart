import 'dart:async';

import 'package:be_sheq_tamara_org_app/features/messages/data/message_repository.dart';
import 'package:be_sheq_tamara_org_app/features/messages/domain/messages_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessagesNotifier extends AutoDisposeFamilyAsyncNotifier<void, String>{

  Object? key;
  List<MessageModel>? messagesList;

  @override
  FutureOr build(String orgId) {
    key = Object();
    ref.onDispose(() {
      key = null;
    });
    return showParticipations(orgId);
  }

  Future showParticipations(String orgId) async {
    state = const AsyncValue.loading();
    final key = this.key;
    messagesList = await MessagesRepository().showFutureOrgMessages(orgId);
    if (key != this.key) {
      return null;
    }
    state = AsyncValue.data(messagesList);

    return state.value;
  }

}
final messagesNotifier = AsyncNotifierProvider.autoDispose.family<MessagesNotifier, void, String>(MessagesNotifier.new);
