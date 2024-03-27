class ParticipationModel {
  String userName;
  String campName;
  String campDate;
  String participationId;

  ParticipationModel({
    required this.userName,
    required this.campName,
    required this.campDate,
    required this.participationId,
  });

  factory ParticipationModel.fromJson(Map<String, dynamic> json) {
    return ParticipationModel(
      userName: json['userName'],
      campName: json['campName'],
      campDate: json['campDate'],
      participationId: json['participationId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'campName': campName,
      'campDate': campDate,
      'participationId': participationId,
    };
  }
}