class OrganizationModel {
  String orgName;
  String orgDec;
  String location;
  String googleLocation;
  String accountName;
  String accountPass;
  int phone;
  String logoImg;
  String id;

  OrganizationModel({
    required this.orgName,
    required this.orgDec,
    required this.location,
    required this.googleLocation,
    required this.accountName,
    required this.accountPass,
    required this.phone,
    required this.logoImg,
    required this.id,
  });

  factory OrganizationModel.fromJson(Map<String, dynamic> json) {
    return OrganizationModel(
      orgName: json['org_name'],
      orgDec: json['org_dec'],
      location: json['location'],
      googleLocation: json['google_loc'],
      accountName: json['account_name'],
      accountPass: json['account_pass'],
      phone: json['phone'],
      logoImg: json['logo_img'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'org_name': orgName,
      'org_dec': orgDec,
      'location': location,
      'google_loc': googleLocation,
      'account_name': accountName,
      'account_pass': accountPass,
      'phone': phone,
      'logo_img': logoImg,
      'id': id,
    };
  }
}