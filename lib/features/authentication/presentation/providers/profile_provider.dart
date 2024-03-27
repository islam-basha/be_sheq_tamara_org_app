import 'dart:async';

import 'package:be_sheq_tamara_org_app/features/authentication/data/profile_repository.dart';
import 'package:be_sheq_tamara_org_app/features/authentication/domain/organization_model.dart';
import 'package:be_sheq_tamara_org_app/features/primary/domain/users_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileNotifier extends AutoDisposeAsyncNotifier{

  Object? key;
  List<OrganizationModel>? profileDataList;
  String account_name='haya_org';
  String account_pass='haya1234';

  @override
  FutureOr build() {
    key = Object();
    ref.onDispose(() {
      key = null;
    });
    return showProfileData();
  }

  Future showProfileData(
      ) async {
    state = const AsyncValue.loading();
    final key = this.key;
    profileDataList = await ProfileRepository().showFutureProfile(account_name,account_pass);
    if (key != this.key) {
      return null;
    }
    state = AsyncValue.data(profileDataList);

    return state.value;
  }

}
final profileNotifier = AutoDisposeAsyncNotifierProvider(ProfileNotifier.new);
