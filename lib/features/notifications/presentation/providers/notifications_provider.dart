import 'dart:async';
import 'package:be_sheq_tamara_org_app/features/notifications/data/pending_repository.dart';
import 'package:be_sheq_tamara_org_app/features/notifications/domain/pending_donations_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsNotifier extends AutoDisposeFamilyAsyncNotifier<void, String>{

  Object? key;
  List<PendingDonModel>? notificationsList;

  @override
  FutureOr build(String orgId) {
    key = Object();
    ref.onDispose(() {
      key = null;
    });
    return showNotifications( orgId);
  }

  Future showNotifications(String orgId) async {
    state = const AsyncValue.loading();
    final key = this.key;
    notificationsList = await PendingDonationRepository().showFutureNotifications(orgId);
    if (key != this.key) {
      return null;
    }
    state = AsyncValue.data(notificationsList);

    return state.value;
  }

}
final notificationsNotifier = AsyncNotifierProvider.autoDispose.family<NotificationsNotifier, void, String>(NotificationsNotifier.new);
