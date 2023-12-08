import 'package:flutter/material.dart';

import '../../../../../domain/models/article_model.dart';
import './top_news.dart';
import 'headline_news.dart';

class NewsListSuccess extends StatelessWidget {
  final List<Article> _articleList;

  const NewsListSuccess({super.key, required List<Article> articleList}) : _articleList = articleList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: EdgeInsets.zero, children: [
        HeadLineNews(article: _articleList.first),
        TopNews(articles: _articleList, name: 'Top News'),
      ]),
    );
  }
}
