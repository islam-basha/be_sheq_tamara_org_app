import 'dart:async';

import 'package:be_sheq_tamara_org_app/features/history/domain/participations_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/history_repository.dart';

class ParticipationssNotifier extends  AutoDisposeFamilyAsyncNotifier<void, String>{

  Object? key;
  List<ParticipationModel>? participationsList;

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
    participationsList = await HistoryRepository().showFutureOrgParticipations(orgId);
    if (key != this.key) {
      return null;
    }
    state = AsyncValue.data(participationsList);
    return state.value;
  }

}
final participationsNotifier =
AsyncNotifierProvider.autoDispose.family<ParticipationssNotifier,void, String>(ParticipationssNotifier.new);
