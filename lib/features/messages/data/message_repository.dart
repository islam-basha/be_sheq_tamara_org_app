import 'package:be_sheq_tamara_org_app/features/messages/domain/messages_model.dart';

import '../../../app/core/api/dio.dart';
import '../../../app/core/api/end_points.dart';

class MessagesRepository{

  static MessagesRepository? _instance;

  MessagesRepository._();

  factory MessagesRepository() {
    if (_instance == null) {
      _instance = MessagesRepository._();
    }
    return _instance!;
  }

  Future<List<MessageModel>?> showFutureOrgMessages( String org_id) async {
    try {
      return await ApiManager.dio.get(
        "${EndPoints.GET_MESSAGES}${org_id}",
      ).then((response) {
        var map = response.data as List<dynamic>;

        return map.map((e) => MessageModel.fromJson(e)).toList();

      });
    } on Exception catch (failure) {
      print(failure);
    }
  }

}