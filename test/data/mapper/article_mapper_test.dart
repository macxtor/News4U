import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news4u/data/dto/article_dto.dart';
import 'package:news4u/data/mapper/article_mapper.dart';
import 'package:news4u/domain/models/article_model.dart';

class MockArticleDto extends Mock implements ArticleDto {}

void main() {
  test('mapArticleDtoToArticle maps correctly', () {
    // Arrange
    final mockArticleDto = MockArticleDto();
    when(() => mockArticleDto.uuid).thenReturn('mock_uuid');
    when(() => mockArticleDto.title).thenReturn('Mock Title');
    when(() => mockArticleDto.description).thenReturn('Mock Description');
    when(() => mockArticleDto.keywords).thenReturn('Mock Keywords');
    when(() => mockArticleDto.snippet).thenReturn('Mock Snippet');
    when(() => mockArticleDto.url).thenReturn('Mock URL');
    when(() => mockArticleDto.imageUrl).thenReturn('Mock Image URL');
    when(() => mockArticleDto.language).thenReturn('Mock Language');
    when(() => mockArticleDto.publishedAt).thenReturn(DateTime.now());
    when(() => mockArticleDto.source).thenReturn('Mock Source');
    when(() => mockArticleDto.categories).thenReturn(['Category1', 'Category2']);
    when(() => mockArticleDto.relevanceScore).thenReturn(0.75);
    when(() => mockArticleDto.locale).thenReturn('Mock Locale');

    // Act
    final result = mapArticleDtoToArticle(mockArticleDto);

    // Assert
    expect(result, isA<Article>());

    // Use verify with the 'get' method to capture the arguments passed to the mock for relevant properties
    verify(() => mockArticleDto.uuid).called(1);
    verify(() => mockArticleDto.title).called(1);
    verify(() => mockArticleDto.description).called(1);
    verify(() => mockArticleDto.keywords).called(1);
    verify(() => mockArticleDto.snippet).called(1);
    verify(() => mockArticleDto.url).called(1);
    verify(() => mockArticleDto.imageUrl).called(1);
    verify(() => mockArticleDto.language).called(1);
    verify(() => mockArticleDto.publishedAt).called(1);
    verify(() => mockArticleDto.source).called(1);
    verify(() => mockArticleDto.categories).called(1);
    verify(() => mockArticleDto.relevanceScore).called(1);
    verify(() => mockArticleDto.locale).called(1);

    expect(result.uuid, 'mock_uuid');
    expect(result.title, 'Mock Title');
    expect(result.description, 'Mock Description');
    expect(result.keywords, 'Mock Keywords');
    expect(result.snippet, 'Mock Snippet');
    expect(result.url, 'Mock URL');
    expect(result.imageUrl, 'Mock Image URL');
    expect(result.language, 'Mock Language');
    expect(result.publishedAt, isA<DateTime>());
    expect(result.source, 'Mock Source');
    expect(result.categories, ['Category1', 'Category2']);
    expect(result.relevanceScore, 0.75);
    expect(result.locale, 'Mock Locale');
  });
}
