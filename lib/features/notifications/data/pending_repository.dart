

import '../../../app/core/api/dio.dart';
import '../../../app/core/api/end_points.dart';
import '../domain/pending_donations_model.dart';

class PendingDonationRepository{

  static PendingDonationRepository? _instance;
  PendingDonationRepository._();

  factory PendingDonationRepository() {
    _instance ??= PendingDonationRepository._();
    return _instance!;
  }

  Future<List<PendingDonModel>?> showFutureNotifications(String org_id) async {
    try {
      return await ApiManager.dio.get(
        "${EndPoints.GET_NOTIFICATIONS}${org_id}",
      ).then((response) {
        var map = response.data as List<dynamic>;

        return map.map((e) => PendingDonModel.fromJson(e)).toList();

      });
    } on Exception catch (failure) {
      print(failure);
    }
  }


}