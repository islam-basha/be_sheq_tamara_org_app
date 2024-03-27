import 'dart:async';

import 'package:be_sheq_tamara_org_app/features/primary/data/users_repository.dart';
import 'package:be_sheq_tamara_org_app/features/primary/domain/users_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersNotifier extends AutoDisposeAsyncNotifier{

  Object? key;
  List<UserModel>? usersList;

  @override
  FutureOr build() {
    key = Object();
    ref.onDispose(() {
      key = null;
    });
    return showUsers();
  }

  Future showUsers(
      ) async {
    state = const AsyncValue.loading();
    final key = this.key;
    usersList = await UsersRepository().showFutureUsers();
    if (key != this.key) {
      return null;
    }
    state = AsyncValue.data(usersList);

    return state.value;
  }

}
final usersNotifier = AutoDisposeAsyncNotifierProvider(UsersNotifier.new);
