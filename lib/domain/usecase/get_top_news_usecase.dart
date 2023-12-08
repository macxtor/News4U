import '../models/article_model.dart';
import '../repository/news_repository.dart';

class GetTopNewsUseCase {
  final NewsRepository _repository;

  GetTopNewsUseCase({required NewsRepository repository}) : _repository = repository;

  Future<List<Article>> execute({int page = 0}) async {
    return await _repository.getTopNews(page: page);
  }
}
