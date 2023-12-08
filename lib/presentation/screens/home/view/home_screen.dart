import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news4u/domain/usecase/get_top_news_usecase.dart';
import 'package:news4u/presentation/screens/home/view/components/news_list.dart';

import '../../../../core/dependencies.dart';
import '../bloc/news_list_bloc.dart';

class HomeScreen extends StatelessWidget {
  final getTopNewsUseCase = getIt<GetTopNewsUseCase>();

  HomeScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsListBloc(getTopNewsUseCase: getTopNewsUseCase),
      child: const NewsView(),
    );
  }
}

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NewsListBloc>().fetchTopNews();
    return BlocBuilder<NewsListBloc, NewsListState>(builder: (context, state) {
      if (state is NewsListInitial || state is NewsListLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is NewsListLoaded) {
        return NewsListSuccess(articleList: state.articleList);
      } else if (state is NewsListError) {
        return Center(child: Text(state.message));
      } else {
        return const Center(child: Text('Unexpected state'));
      }
    });
  }
}
