class MessageModel {
  String id;
  String msg;
  String date;
  String userId;
  String orgId;

  MessageModel({
    required this.id,
    required this.msg,
    required this.date,
    required this.userId,
    required this.orgId,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      msg: json['msg'],
      date: json['date'],
      userId: json['user_id'],
      orgId: json['org_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'msg': msg,
      'date': date,
      'user_id': userId,
      'org_id': orgId,
    };
  }
}