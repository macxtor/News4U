part of 'news_list_bloc.dart';

abstract class NewsListState extends Equatable {
  const NewsListState();

  @override
  List<Object> get props => [];
}

class NewsListLoading extends NewsListState {}

class NewsListInitial extends NewsListState {}

class NewsListLoaded extends NewsListState {
  final List<Article> articleList;

  const NewsListLoaded({required this.articleList});

  @override
  List<Object> get props => [articleList];
}

class NewsListError extends NewsListState {
  final String message;

  const NewsListError(this.message);

  @override
  List<Object> get props => [message];
}
