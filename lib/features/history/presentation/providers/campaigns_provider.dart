import 'dart:async';

import 'package:be_sheq_tamara_org_app/features/history/domain/campaigns_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/history_repository.dart';

class CampaignsNotifier extends AutoDisposeAsyncNotifier{

  Object? key;
  List<CampaignModel>? campaignsList;
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
    campaignsList = await HistoryRepository().showFutureOrgCampaigns(org_id);
    if (key != this.key) {
      return null;
    }
    state = AsyncValue.data(campaignsList);

    return state.value;
  }

}
final campaignsNotifier = AutoDisposeAsyncNotifierProvider(CampaignsNotifier.new);
