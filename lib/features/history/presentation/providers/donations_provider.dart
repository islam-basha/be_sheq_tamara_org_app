import 'dart:async';

import 'package:be_sheq_tamara_org_app/features/history/domain/donations_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/history_repository.dart';

class DonationsNotifier extends  AutoDisposeFamilyAsyncNotifier<void, String>{

  Object? key;
  List<DonationModel>? donationsList;

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
    donationsList = await HistoryRepository().showFutureOrgDonaions(orgId);
    if (key != this.key) {
      return null;
    }
    state = AsyncValue.data(donationsList);

    return state.value;
  }

}
final donationsNotifier =
AsyncNotifierProvider.autoDispose.family<DonationsNotifier,void, String>(DonationsNotifier.new);
