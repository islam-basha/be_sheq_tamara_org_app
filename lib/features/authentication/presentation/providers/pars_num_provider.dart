import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/profile_repository.dart';

class ParsNumNotifier extends AutoDisposeAsyncNotifier{

  Object? key;
  int? parsNum;
  String org_id='org101';


  @override
  FutureOr build() {
    key = Object();
    ref.onDispose(() {
      key = null;
    });
    return showParsNum();
  }

  Future showParsNum() async {
    state = const AsyncValue.loading();
    final key = this.key;
    parsNum = await ProfileRepository().showFutureOrgPars(org_id);
    if (key != this.key) {
      return null;
    }
    state = AsyncValue.data(parsNum);
    return state.value;
  }

}
final parsNumNotifier = AutoDisposeAsyncNotifierProvider(ParsNumNotifier.new);
