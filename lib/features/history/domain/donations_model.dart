class DonationModel {
  String userId;
  String orgId;
  String donDate;
  int catId;
  String driver;
  String qty;
  String id;

  DonationModel({
    required this.userId,
    required this.orgId,
    required this.donDate,
    required this.catId,
    required this.driver,
    required this.qty,
    required this.id,
  });

  factory DonationModel.fromJson(Map<String, dynamic> json) {
    return DonationModel(
      userId: json['user_id'],
      orgId: json['org_id'],
      donDate: json['don_date'],
      catId: json['cat_id'],
      driver: json['driver'],
      qty: json['qty'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'org_id': orgId,
      'don_date': donDate,
      'cat_id': catId,
      'driver': driver,
      'qty': qty,
      'id': id,
    };
  }
}