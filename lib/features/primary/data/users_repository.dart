
import 'package:be_sheq_tamara_org_app/features/primary/domain/users_model.dart';

import '../../../app/core/api/dio.dart';
import '../../../app/core/api/end_points.dart';

class UsersRepository{

  static UsersRepository? _instance;

  UsersRepository._();

  factory UsersRepository() {
    if (_instance == null) {
      _instance = UsersRepository._();
    }
    return _instance!;
  }

  Future<List<UserModel>?> showFutureUsers() async {
    try {
      return await ApiManager.dio.get(
        "${EndPoints.GET_USERS}",
      ).then((response) {
        var map = response.data as List<dynamic>;

        return map.map((e) => UserModel.fromJson(e)).toList();

      });
    } on Exception catch (failure) {
      print(failure);
    }
  }

}