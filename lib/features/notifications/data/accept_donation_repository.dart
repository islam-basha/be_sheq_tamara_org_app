import 'package:be_sheq_tamara_org_app/features/notifications/domain/accept_donations_model.dart';
import '../../../app/core/api/dio.dart';
import '../../../app/core/api/end_points.dart';

class AcceptDonationRepository{

  static AcceptDonationRepository? _instance;
  AcceptDonationRepository._();

  factory AcceptDonationRepository() {
    _instance ??= AcceptDonationRepository._();
    return _instance!;
  }

  Future<void> acceptDonation(AcceptDonationModel don) async{
    try{
      await ApiManager.dio.post(EndPoints.ACCEPT_DONATION,data: don.toJson());
    }on Exception catch (failure) {
      print(failure);
    }
  }

  Future deleteDonation(String donId) async {
    try {
      return await ApiManager.dio.get(
        "${EndPoints.DELETE_DONATION}$donId",
      ).then((response) {
        return ;
      });
    } on Exception catch (failure) {
      print(failure);
    }
  }
}