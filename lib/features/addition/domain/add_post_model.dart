
import 'dart:io';

class AddPostModel {
  String postTitle;
  String postText;
  String date;
  String orgId;
  File? image;
  String id;
  bool state;

  AddPostModel({
    required this.postTitle,
    required this.postText,
    required this.date,
    required this.orgId,
     this.image,
    required this.id,
    required this.state,
  });

  factory AddPostModel.fromJson(Map<String, dynamic> json) {
    return AddPostModel(
      postTitle: json['post_title'],
      postText: json['post_text'],
      date: json['date'],
      orgId: json['org_id'],
      image: json['image'],
      id: json['id'],
      state: json['state']
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
      'state': state,
    };
  }
}