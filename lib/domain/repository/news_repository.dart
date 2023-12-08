import 'package:news4u/domain/models/article_model.dart';

abstract class NewsRepository {
  Future<List<Article>> getTopNews({int page = 0});
}
