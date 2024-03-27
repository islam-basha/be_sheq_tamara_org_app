class PostModel {
  String postTitle;
  String postText;
  String date;
  String orgId;
  String image;
  String id;

  PostModel({
    required this.postTitle,
    required this.postText,
    required this.date,
    required this.orgId,
    required this.image,
    required this.id,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      postTitle: json['post_title'],
      postText: json['post_text'],
      date: json['date'],
      orgId: json['org_id'],
      image: json['image'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'post_title': postTitle,
      'post_text': postText,
      'date': date,
      'org_id': orgId,
      'image': image,
      'id': id,
    };
  }
}