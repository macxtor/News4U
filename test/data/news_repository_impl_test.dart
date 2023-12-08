import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news4u/core/failure.dart';
import 'package:news4u/data/news_repository_impl.dart';
import 'package:news4u/data/source/local_storage.dart';
import 'package:news4u/data/source/network_api.dart';
import 'package:news4u/domain/models/article_model.dart';

import 'mock_article.dart';

class MockNetworkApi extends Mock implements NetworkApi {}

class MockLocalStorage extends Mock implements LocalStorage {}

void main() {
  late NewsRepositoryImpl newsRepository;
  late MockNetworkApi mockNetworkApi;
  late MockLocalStorage mockLocalStorage;

  setUp(() {
    mockNetworkApi = MockNetworkApi();
    mockLocalStorage = MockLocalStorage();
    newsRepository = NewsRepositoryImpl(api: mockNetworkApi, localStorage: mockLocalStorage);
  });

  test('getTopNews returns articles from cache if cache is fresh', () async {
    // Arrange
    final cachedList = [mockRecentArticle];
    when(() => mockLocalStorage.loadTopNewsPage(page: any(named: 'page'))).thenAnswer((_) async => cachedList);

    // Act
    final result = await newsRepository.getTopNews();

    // Assert
    verify(() => mockLocalStorage.loadTopNewsPage(page: any(named: 'page'))).called(1);
    verifyNever(() => mockNetworkApi.getTopNews(page: any(named: 'page')));
    expect(result, isA<List<Article>>());
  });

  test('getTopNews fetches articles from network if cache is not fresh', () async {
    // Arrange
    const page = 1;
    final cachedList = [mockOldArticle];
    final networkList = [mockRecentArticle];
    when(() => mockLocalStorage.loadTopNewsPage(page: page)).thenAnswer((_) async {
      return Future.value(cachedList);
    });
    when(() => mockNetworkApi.getTopNews(page: page)).thenAnswer((_) async {
      return Future.value(networkList);
    });

    when(
      () => mockLocalStorage.saveTopNewsPage(
        page: page,
        list: networkList,
      ),
    ).thenAnswer((_) async => true);

    // Act
    await newsRepository.getTopNews(page: page);

    // Assert
    verify(() => mockLocalStorage.loadTopNewsPage(page: page)).called(1);
    verify(() => mockNetworkApi.getTopNews(page: page)).called(1);
    verify(() => mockLocalStorage.saveTopNewsPage(page: page, list: networkList)).called(1);
    verifyNoMoreInteractions(mockLocalStorage);
    verifyNoMoreInteractions(mockNetworkApi);
  });

  test('getTopNews handles error and returns Failure', () async {
    // Arrange
    const page = 1;
    when(() => mockLocalStorage.loadTopNewsPage(page: page)).thenThrow(Exception());

    // Act + Assert
    await expectLater(() => newsRepository.getTopNews(page: page), throwsA(isA<Failure>()));

    // Additional assertions outside the expect block if needed
    verify(() => mockLocalStorage.loadTopNewsPage(page: any(named: 'page'))).called(1);
    verifyNever(() => mockNetworkApi.getTopNews(page: any(named: 'page')));
  });
}
