import 'package:dio/dio.dart';
import 'package:social_media/core/constants/enums/service_path_enum.dart';
import 'package:social_media/core/constants/fetch_limit/fetch_limit_constant.dart';
import 'package:social_media/posts/models/post_model.dart';
import 'dart:io';

class PostService {
  Future<List<PostModel>> fetchPosts(int page) async {
    var dio = Dio();
    final response = await dio.get(ServicePathEnum.BASE_URL.rawValue +
        "posts?_limit=$FetchLimitConstant.FETCH_LIMIT&_page=$page");
    if (response.statusCode == HttpStatus.ok) {
      final data = List.from(response.data);

      final result = data.map((e) => PostModel.fromJson(e)).toList();

      return result;
    }

    return [];
  }
}
