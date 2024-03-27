import 'package:be_sheq_tamara_org_app/features/authentication/domain/organization_model.dart';

import '../../../app/core/api/dio.dart';
import '../../../app/core/api/end_points.dart';
import '../../primary/domain/users_model.dart';

class ProfileRepository{

  static ProfileRepository? _instance;

  ProfileRepository._();

  factory ProfileRepository() {
    if (_instance == null) {
      _instance = ProfileRepository._();
    }
    return _instance!;
  }

  Future<List<OrganizationModel>?> showFutureProfile(String account_name,String account_pass) async {
    try {
      return await ApiManager.dio.get(
        "${EndPoints.GET_PROFILE}${account_name}/${account_pass}",
      ).then((response) {
        var map = response.data as List<dynamic>;

        return map.map((e) => OrganizationModel.fromJson(e)).toList();

      });
    } on Exception catch (failure) {
      print(failure);
    }
  }

  Future<int> showFutureOrgPars(String org_id) async {
    try {
      return await ApiManager.dio.get(
        "${EndPoints.GET_PARs_FOR_ORG}${org_id}",
      ).then((response) {
        var map = response.data as int;
        return map;

      });
    } on Exception catch (failure) {
      print(failure);
      return 0;
    }
  }
}