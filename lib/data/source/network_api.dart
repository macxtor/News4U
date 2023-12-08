import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../dto/article_dto.dart';
import '../dto/news_response_dto.dart';

abstract class NetworkApi {
  Future<List<ArticleDto>> getTopNews({int page});
}

class NetworkApiImpl implements NetworkApi {
  static const String apiKey = "uxzzmXKkw63h1l32gNmsA4EXGCLVbcR93Jz7E4lp";
  static const String baseUrl = "https://api.thenewsapi.com/v1/news/top?api_token=$apiKey&locale=gb&limit=3";
  final Dio dio;

  NetworkApiImpl({required this.dio});

  @override
  Future<List<ArticleDto>> getTopNews({int page = 0}) async {
    try {
      final Response response = await dio.get(baseUrl);
      final newsResponseDto = NewsResponseDto.fromJson(response.data);
      return newsResponseDto.dataDto;
    } on DioException catch (e) {
      _handleDioError(e);
      return [];
    }
  }

  void _handleDioError(DioException e) {
    if (e.response != null) {
      if (kDebugMode) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      }
    } else {
      if (kDebugMode) {
        print(e.requestOptions);
        print(e.message);
      }
    }
  }
}
