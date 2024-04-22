import 'dart:async';
import 'package:be_sheq_tamara_org_app/features/authentication/data/profile_repository.dart';
import 'package:be_sheq_tamara_org_app/features/authentication/domain/organization_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllOrgsNotifier extends AutoDisposeAsyncNotifier{

  Object? key;
  List<OrganizationModel>? OrgsList;

  @override
  FutureOr build() {
    key = Object();
    ref.onDispose(() {
      key = null;
    });
    return showOrgs();
  }

  Future showOrgs(
      ) async {
    state = const AsyncValue.loading();
    final key = this.key;
    OrgsList = await ProfileRepository().showOrgs(ref);
    if (key != this.key) {
      return null;
    }
    return state.value;
  }

}
final allOrgsNotifier = AutoDisposeAsyncNotifierProvider(AllOrgsNotifier.new);
