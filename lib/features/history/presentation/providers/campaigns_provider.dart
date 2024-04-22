import 'dart:async';

import 'package:be_sheq_tamara_org_app/features/history/domain/campaigns_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/history_repository.dart';

class CampaignsNotifier extends AutoDisposeFamilyAsyncNotifier<void, String>{

  Object? key;
  List<CampaignModel>? campaignsList;

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
    campaignsList = await HistoryRepository().showFutureOrgCampaigns(orgId);
    if (key != this.key) {
      return null;
    }
    state = AsyncValue.data(campaignsList);

    return state.value;
  }

}
final campaignsNotifier =
AsyncNotifierProvider.autoDispose.family<CampaignsNotifier,void, String>(CampaignsNotifier.new);
