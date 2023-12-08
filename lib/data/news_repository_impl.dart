import 'package:dio/dio.dart';

import '../core/failure.dart';
import '../domain/models/article_model.dart';
import '../domain/repository/news_repository.dart';
import 'dto/article_dto.dart';
import 'mapper/article_mapper.dart';
import 'source/local_storage.dart';
import 'source/network_api.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NetworkApi _api;
  final LocalStorage _localStorage;

  NewsRepositoryImpl({
    required NetworkApi api,
    required LocalStorage localStorage,
  })  : _api = api,
        _localStorage = localStorage;

  @override
  Future<List<Article>> getTopNews({int page = 0}) async {
    try {
      final cachedList = await _localStorage.loadTopNewsPage(page: page);

      if (isCacheFresh(cachedList)) {
        return _mapDtoListToModelList(cachedList);
      }

      final fetchedList = await _api.getTopNews(page: page);
      await _localStorage.saveTopNewsPage(page: page, list: fetchedList);

      return _mapDtoListToModelList(fetchedList);
    } catch (e,stackTrace) {
      print("Unexpected error in getTopNews: $e");
      print(stackTrace);
      return Future.error(Failure("Unexpected error occurred: $e"));
    }
  }

  bool isCacheFresh(List<ArticleDto>? cachedList) {
    if (cachedList != null && cachedList.isNotEmpty) {
      const int expirationTimeInMinutes = 60; // 1 hour
      final DateTime lastFetchTime = cachedList.first.publishedAt;
      final Duration difference = DateTime.now().difference(lastFetchTime);
      return difference.inMinutes < expirationTimeInMinutes;
    }
    return false;
  }

  List<Article> _mapDtoListToModelList(List<ArticleDto> dtoList) {
    return dtoList.map<Article>((dto) => mapArticleDtoToArticle(dto)).toList();
  }
}
