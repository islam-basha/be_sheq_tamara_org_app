
import 'package:be_sheq_tamara_org_app/features/history/domain/campaigns_model.dart';
import 'package:be_sheq_tamara_org_app/features/history/domain/donations_model.dart';
import 'package:be_sheq_tamara_org_app/features/history/domain/participations_model.dart';

import '../../../app/core/api/dio.dart';
import '../../../app/core/api/end_points.dart';
import '../domain/posts_model.dart';

class HistoryRepository{

  static HistoryRepository? _instance;

  HistoryRepository._();

  factory HistoryRepository() {
    _instance ??= HistoryRepository._();
    return _instance!;
  }

  Future<List<PostModel>?> showFutureOrgPosts( String org_id) async {
    try {
      return await ApiManager.dio.get(
        "${EndPoints.GET_ORG_POSTS}${org_id}",
      ).then((response) {
        var map = response.data as List<dynamic>;

        return map.map((e) => PostModel.fromJson(e)).toList();

      });
    } on Exception catch (failure) {
      print(failure);
    }
  }

  Future<List<ParticipationModel>?> showFutureOrgParticipations( String org_id) async {
    try {
      return await ApiManager.dio.get(
        "${EndPoints.GET_ORG_PARTICIPATIONS}${org_id}",
      ).then((response) {
        var map = response.data as List<dynamic>;

        return map.map((e) => ParticipationModel.fromJson(e)).toList();

      });
    } on Exception catch (failure) {
      print(failure);
    }
  }

  Future<List<DonationModel>?> showFutureOrgDonaions( String org_id) async {
    try {
      return await ApiManager.dio.get(
        "${EndPoints.GET_ORG_DONAIONS}${org_id}",
      ).then((response) {
        var map = response.data as List<dynamic>;

        return map.map((e) => DonationModel.fromJson(e)).toList();

      });
    } on Exception catch (failure) {
      print(failure);
    }
  }

  Future<List<CampaignModel>?> showFutureOrgCampaigns( String org_id) async {
    try {
      return await ApiManager.dio.get(
        "${EndPoints.GET_ORG_CAMPAIGNS}${org_id}",
      ).then((response) {
        var map = response.data as List<dynamic>;

        return map.map((e) => CampaignModel.fromJson(e)).toList();

      });
    } on Exception catch (failure) {
      print(failure);
    }
  }

  Future deleteCamp(String campId) async {
    try {
      return await ApiManager.dio.get(
        "${EndPoints.DELETE_CAMP}$campId",
      ).then((response) {
        return ;
      });
    } on Exception catch (failure) {
      print(failure);
    }
  }

  Future deletePost(String postId) async {
    try {
      return await ApiManager.dio.get(
        "${EndPoints.DELETE_POST}$postId",
      ).then((response) {
        return ;
      });
    } on Exception catch (failure) {
      print(failure);
    }
  }

}