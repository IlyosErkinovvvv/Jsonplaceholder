import 'package:dio/dio.dart';
import 'package:jsonplaceholder/core/config/dio_catch_error_config.dart';
import 'package:jsonplaceholder/core/config/dio_config.dart';
import 'package:jsonplaceholder/data/model/comments_model.dart';

class CommentsService {
  Future<dynamic> getComments() async {
    try {
      Response response = await DioConfig.createRequest()
          .get("https://jsonplaceholder.typicode.com/comments");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => CommentsModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return DioCatchError.catchError(e);
    }
  }
}
