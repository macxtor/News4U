import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news4u/core/failure.dart';
import 'package:news4u/domain/usecase/get_top_news_usecase.dart';
import 'package:news4u/presentation/screens/home/bloc/news_list_bloc.dart';

import '../../../mock_article.dart';

class MockGetTopNewsUseCase extends Mock implements GetTopNewsUseCase {}

void main() {
  late NewsListBloc newsListBloc;
  late MockGetTopNewsUseCase mockGetTopNewsUseCase;

  setUp(() {
    mockGetTopNewsUseCase = MockGetTopNewsUseCase();
    newsListBloc = NewsListBloc(getTopNewsUseCase: mockGetTopNewsUseCase);
  });

  group('NewsListBloc', () {
    blocTest<NewsListBloc, NewsListState>(
      'emits [NewsListLoading, NewsListLoaded] when fetchTopNews is successful',
      build: () {
        when(() => mockGetTopNewsUseCase.execute(page: 0)).thenAnswer((_) async => [mockRecentArticle]);
        return newsListBloc;
      },
      act: (bloc) => bloc.fetchTopNews(),
      expect: () => [
        NewsListLoading(),
        NewsListLoaded(articleList: [mockRecentArticle]),
      ],
    );

    blocTest<NewsListBloc, NewsListState>(
      'emits [NewsListLoading, NewsListError] when fetchTopNews throws an exception',
      build: () {
        when(() => mockGetTopNewsUseCase.execute(page: 0)).thenThrow(Exception('Mock exception'));
        return newsListBloc;
      },
      act: (bloc) => bloc.fetchTopNews(),
      expect: () => [
        NewsListLoading(),
        const NewsListError('Error fetching top news: Exception: Mock exception'),
      ],
    );

    blocTest<NewsListBloc, NewsListState>(
      'emits [NewsListLoading, NewsListError] when fetchTopNews returns a Failure',
      build: () {
        when(() => mockGetTopNewsUseCase.execute(page: 0)).thenThrow(Failure('Mock failure'));
        return newsListBloc;
      },
      act: (bloc) => bloc.fetchTopNews(),
      expect: () => [
        NewsListLoading(),
        const NewsListError('Error fetching top news: Failure: Mock failure'),
      ],
    );
  });
}
