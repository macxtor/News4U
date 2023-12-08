import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news4u/domain/models/article_model.dart';
import 'package:news4u/domain/repository/news_repository.dart';
import 'package:news4u/domain/usecase/get_top_news_usecase.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

class MockArticle extends Mock implements Article {}

void main() {
  test('GetTopNewsUseCase executes successfully', () async {
    final mockRepository = MockNewsRepository();
    final mockArticle = MockArticle();
    when(() => mockRepository.getTopNews(page: any(named: 'page'))).thenAnswer((_) async => [mockArticle]);
    final getTopNewsUseCase = GetTopNewsUseCase(repository: mockRepository);

    final result = await getTopNewsUseCase.execute();

    expect(result, isA<List<Article>>());
    expect(result.length, 1);
  });

  test('GetTopNewsUseCase handles failed repository response', () async {
    // Arrange
    final mockRepository = MockNewsRepository();
    final getTopNewsUseCase = GetTopNewsUseCase(repository: mockRepository);

    when(() => mockRepository.getTopNews(page: any(named: 'page')))
        .thenAnswer((_) async => throw Exception('Failed to load news'));

    expect(() async => await getTopNewsUseCase.execute(), throwsException);
  });
}
