class CampaignModel {
  String campTitle;
  String campDec;
  String location;
  String startDate;
  String campImage;
  String orgId;
  String id;

  CampaignModel({
    required this.campTitle,
    required this.campDec,
    required this.location,
    required this.startDate,
    required this.campImage,
    required this.orgId,
    required this.id,
  });

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
      campTitle: json['camp_title'],
      campDec: json['camp_dec'],
      location: json['location'],
      startDate: json['start_date'],
      campImage: json['camp_image'],
      orgId: json['org_id'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'camp_title': campTitle,
      'camp_dec': campDec,
      'location': location,
      'start_date': startDate,
      'camp_image': campImage,
      'org_id': orgId,
      'id': id,
    };
  }
}