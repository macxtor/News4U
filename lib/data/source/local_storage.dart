import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../dto/article_dto.dart';

abstract class LocalStorage {
  Future<bool> saveTopNewsPage({
    required int page,
    required List<ArticleDto> list,
  });

  Future<List<ArticleDto>> loadTopNewsPage({required int page});
}

class LocalStorageImpl implements LocalStorage {
  final String _topNewsKey = 'topNews';

  @override
  Future<List<ArticleDto>> loadTopNewsPage({required int page}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? cachedData = prefs.getString('$_topNewsKey$page');

      if (cachedData != null) {
        final List<dynamic> decodedList = json.decode(cachedData) as List<dynamic>;
        final List<ArticleDto> articles = decodedList.map((item) => ArticleDto.fromJson(item)).toList();
        return articles;
      }

      return [];
    } catch (e) {
      print("Error in loadTopNewsPage: $e");
      return []; // or handle the error appropriately
    }
  }

  @override
  Future<bool> saveTopNewsPage({required int page, required List<ArticleDto> list}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encodedList = json.encode(list.map((item) => item.toJson()).toList());
    return await prefs.setString('$_topNewsKey$page', encodedList);
  }
}
