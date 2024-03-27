import 'dart:async';

import 'package:be_sheq_tamara_org_app/features/history/domain/participations_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/history_repository.dart';

class ParticipationssNotifier extends AutoDisposeAsyncNotifier{

  Object? key;
  List<ParticipationModel>? participationsList;
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
    participationsList = await HistoryRepository().showFutureOrgParticipations(org_id);
    if (key != this.key) {
      return null;
    }
    state = AsyncValue.data(participationsList);
    return state.value;
  }

}
final participationsNotifier = AutoDisposeAsyncNotifierProvider(ParticipationssNotifier.new);
