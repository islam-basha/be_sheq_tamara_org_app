import 'dart:async';

import 'package:be_sheq_tamara_org_app/features/history/domain/donations_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/history_repository.dart';

class DonationsNotifier extends AutoDisposeAsyncNotifier{

  Object? key;
  List<DonationModel>? donationsList;
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
    donationsList = await HistoryRepository().showFutureOrgDonaions(org_id);
    if (key != this.key) {
      return null;
    }
    state = AsyncValue.data(donationsList);

    return state.value;
  }

}
final donationsNotifier = AutoDisposeAsyncNotifierProvider(DonationsNotifier.new);
