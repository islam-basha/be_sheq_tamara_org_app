
import 'package:be_sheq_tamara_org_app/app/core/api/end_points.dart';
import 'package:be_sheq_tamara_org_app/features/addition/domain/add_post_model.dart';
import 'package:dio/dio.dart';

import '../../../app/core/api/dio.dart';

class AddPostRepository {
  static AddPostRepository? _instance;
  AddPostRepository._();

  factory AddPostRepository() {
    _instance ??= AddPostRepository._();
    return _instance!;
  }

  Future<void> addPost(AddPostModel newPost) async {

    MultipartFile? imagePost;

    if(newPost.image!=null){
      String fileName=newPost.image!.path.split('/').last;
      imagePost= await MultipartFile.fromFile(newPost.image!.path,filename: fileName,);
    }else{
      imagePost=null;
    }

    try {
      await ApiManager.dio.post(EndPoints.ADD_POST,
          data: FormData.fromMap({
            'post_title': newPost.postTitle,
            'post_text': newPost.postText,
            'date': newPost.date.toString(),
            'org_id': newPost.orgId,
            'image': imagePost,
            'id': newPost.id,
            'state': newPost.state.toString()
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