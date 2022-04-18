import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:social_media/core/constants/enums/service_path_enum.dart';
import 'package:social_media/posts/models/comment_model.dart';

class CommentService {

  Future<List<CommentModel>> fetchComments(postId) async {
    var dio = Dio();
    final response = await dio
        .get(ServicePathEnum.BASE_URL.rawValue+"comments?postId=$postId");
    if (response.statusCode == HttpStatus.ok) {
      final data = List.from(response.data);

      final result = data.map((e) => CommentModel.fromJson(e)).toList();

      return result;
    }

    return [];
  }
}
