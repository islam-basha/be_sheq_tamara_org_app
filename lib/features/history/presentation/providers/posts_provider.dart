import 'dart:async';
import 'package:be_sheq_tamara_org_app/features/history/data/history_repository.dart';
import 'package:be_sheq_tamara_org_app/features/history/domain/posts_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostsNotifier extends AutoDisposeAsyncNotifier{

  Object? key;
  List<PostModel>? postsList;
  String org_id='org101';

  @override
  FutureOr build() {
    key = Object();
    ref.onDispose(() {
      key = null;
    });
    return showPosts();
  }

  Future showPosts(
      ) async {
    state = const AsyncValue.loading();
    final key = this.key;
    postsList = await HistoryRepository().showFutureOrgPosts(org_id);
    if (key != this.key) {
      return null;
    }
    state = AsyncValue.data(postsList);
    print(state.value);
    return state.value;
  }

}
final postsNotifier = AutoDisposeAsyncNotifierProvider(PostsNotifier.new);
