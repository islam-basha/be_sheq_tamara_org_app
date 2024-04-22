
import 'package:be_sheq_tamara_org_app/app/core/api/end_points.dart';
import 'package:be_sheq_tamara_org_app/features/addition/domain/add_campaign_model.dart';
import 'package:dio/dio.dart';

import '../../../app/core/api/dio.dart';

class AddCampRepository {
  static AddCampRepository? _instance;
  AddCampRepository._();

  factory AddCampRepository() {
    _instance ??= AddCampRepository._();
    return _instance!;
  }

  Future<void> addCamp(AddCampaignModel newCampaign) async {

    MultipartFile? image;

    if(newCampaign.campImage!=null){
      String fileName=newCampaign.campImage!.path.split('/').last;
      image= await MultipartFile.fromFile(newCampaign.campImage!.path,filename: fileName,);
    }else{
      image=null;
    }

    try {
       await ApiManager.dio.post(EndPoints.ADD_CAMP,
          data: FormData.fromMap({
            "id":newCampaign.id,
            'camp_title':newCampaign.campTitle,
            'camp_dec': newCampaign.campDec,
            'location': newCampaign.location,
            'start_date': newCampaign.startDate,
            'camp_image': image,
            'org_id': newCampaign.orgId,
          }

          ),
          options: Options(
            sendTimeout: const Duration(seconds: 60),
            contentType: 'multipart/form-data',
          ));

    } catch (e) {
      if (e is DioException) {
        final response = e.response;
        if (response != null) {
          final statusCode = response.statusCode;
          final responseData = response.data;
          final errorMessage = responseData['message'];
          print("Error: $statusCode - $errorMessage");
          print('Error: $e');
        }
      }
    }
  }

}