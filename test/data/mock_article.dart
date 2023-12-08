import 'package:news4u/data/dto/article_dto.dart';

var mockRecentArticle = ArticleDto(
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
    categories: ["categories"],
    relevanceScore: "relevanceScore",
    locale: "locale");

var mockOldArticle = ArticleDto(
    uuid: "uuid-old",
    title: "title",
    description: "description",
    keywords: "keywords",
    snippet: "snippet",
    url: "url",
    imageUrl: "imageUrl",
    language: "language",
    publishedAt: DateTime(2022, 9, 8),
    source: "source",
    categories: ["categories"],
    relevanceScore: "relevanceScore",
    locale: "locale");
