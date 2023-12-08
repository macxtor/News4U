import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news4u/domain/usecase/get_top_news_usecase.dart';

import '../../../../domain/models/article_model.dart';

part 'news_list_state.dart';

class NewsListBloc extends Cubit<NewsListState> {
  final GetTopNewsUseCase getTopNewsUseCase;

  NewsListBloc({required this.getTopNewsUseCase}) : super(NewsListInitial());

  Future<void> fetchTopNews({int page = 0}) async {
    try {
      emit(NewsListLoading());
      final List<Article> topNews = await getTopNewsUseCase.execute(page: page);
      emit(NewsListLoaded(articleList: topNews));
    } catch (e) {
      emit(NewsListError("Error fetching top news: $e"));
    }
  }
}
