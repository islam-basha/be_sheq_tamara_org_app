class PendingDonModel {
  String id;
  String userId;
  String orgId;
  int userPhone;
  String donDate;
  String catId;
  String driver;
  String qty;
  String orgName;


  PendingDonModel({
    required this.userId,
    required this.orgId,
    required this.donDate,
    required this.catId,
    required this.driver,
    required this.qty,
    required this.orgName,
    required this.userPhone,
    required this.id
  });

  factory PendingDonModel.fromJson(Map<String, dynamic> json) {
    return PendingDonModel(
      id: json['id'],
      userId: json['user_id'],
      orgId: json['org_id'],
      donDate: json['don_date'],
      catId: json['cat_id'],
      driver: json['driver'],
      qty: json['qty'],
      orgName: json['org_name'],
      userPhone: json['user_phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'user_id': userId,
      'org_id': orgId,
      'don_date': donDate,
      'cat_id': catId,
      'driver': driver,
      'qty': qty,
      'org_name': orgName,
      'user_phone':userPhone,
    };
  }
}