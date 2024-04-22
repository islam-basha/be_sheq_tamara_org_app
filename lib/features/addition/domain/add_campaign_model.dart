import 'dart:io';

class AddCampaignModel {
  String id;
  String campTitle;
  String campDec;
  String location;
  String startDate;
  File? campImage;
  String orgId;


  AddCampaignModel({
    required this.id,
    required this.campTitle,
    required this.campDec,
    required this.location,
    required this.startDate,
     this.campImage,
    required this.orgId,
  });

  factory AddCampaignModel.fromJson(Map<String, dynamic> json) {
    return AddCampaignModel(
      id: json['id'],
      campTitle: json['camp_title'],
      campDec: json['camp_dec'],
      location: json['location'],
      startDate: json['start_date'],
      campImage: json['camp_image'],
      orgId: json['org_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'camp_title': campTitle,
      'camp_dec': campDec,
      'location': location,
      'start_date': startDate,
      'camp_image': campImage,
      'org_id': orgId,
    };
  }
}