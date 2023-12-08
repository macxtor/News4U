import 'package:news4u/domain/models/article_model.dart';

var mockRecentArticle = Article(
    uuid: "uuid",
    title: "title",
    description: "description",
    keywords: "keywords",
    snippet: "snippet",
    url: "url",
    imageUrl: "imageUrl",
    language: "language",
    publishedAt: DateTime.now(),
    source: "source",
    categories: const ["categories"],
    relevanceScore: "relevanceScore",
    locale: "locale");
