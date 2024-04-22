import 'package:be_sheq_tamara_org_app/features/authentication/domain/organization_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/core/api/dio.dart';
import '../../../app/core/api/end_points.dart';

class ProfileRepository{

  static ProfileRepository? _instance;

  ProfileRepository._();

  factory ProfileRepository() {
    _instance ??= ProfileRepository._();
    return _instance!;
  }

  Future<List<OrganizationModel>?> showFutureProfile(String account_name,String account_pass) async {
    try {
      return await ApiManager.dio.get(
        "${EndPoints.GET_PROFILE}$account_name/$account_pass",
      ).then((response) {
        var map = response.data as List<dynamic>;
        return map.map((e) => OrganizationModel.fromJson(e)).toList();
      });
    } on Exception catch (failure) {
      return null;
    }
  }

  Future<int> showFutureOrgPars(String orgId) async {
    try {
      return await ApiManager.dio.get(
        "${EndPoints.GET_PARs_FOR_ORG}$orgId",
      ).then((response) {
        var map = response.data as int;
        return map;

      });
    } on Exception catch (failure) {
      print(failure);
      return 0;
    }
  }

  Future<List<OrganizationModel>?> showOrgs(
      AutoDisposeAsyncNotifierProviderRef<dynamic> ref,
      ) async {
    try {
      return await ApiManager.dio
          .get(
        "${EndPoints.GET_ORGS}",
      )
          .then((response) {
        var map = response.data as List<dynamic>;
        return map.map((e) => OrganizationModel.fromJson(e)).toList();
      });
    } on Exception catch (failure) {
      print(failure);
    }
  }
}