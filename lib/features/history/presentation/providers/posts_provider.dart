import 'dart:async';
import 'package:be_sheq_tamara_org_app/features/history/data/history_repository.dart';
import 'package:be_sheq_tamara_org_app/features/history/domain/posts_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostsNotifier extends AutoDisposeFamilyAsyncNotifier<void, String>{

  Object? key;
  List<PostModel>? postsList;

  @override
  FutureOr build(String orgId) {
    key = Object();
    ref.onDispose(() {
      key = null;
    });
    return showPosts(orgId);
  }

  Future showPosts(String orgId) async {
    state = const AsyncValue.loading();
    final key = this.key;
    postsList = await HistoryRepository().showFutureOrgPosts(orgId);
    if (key != this.key) {
      return null;
    }
    state = AsyncValue.data(postsList);
    return state.value;
  }

}
final postsNotifier =
AsyncNotifierProvider.autoDispose.family<PostsNotifier,void, String>(PostsNotifier.new);
