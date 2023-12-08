import 'package:news4u/domain/models/article_model.dart';

import '../dto/article_dto.dart';

Article mapArticleDtoToArticle(ArticleDto articleDto) => Article(
      uuid: articleDto.uuid,
      title: articleDto.title,
      description: articleDto.description,
      keywords: articleDto.keywords,
      snippet: articleDto.snippet,
      url: articleDto.url,
      imageUrl: articleDto.imageUrl,
      language: articleDto.language,
      publishedAt: articleDto.publishedAt,
      source: articleDto.source,
      categories: articleDto.categories,
      relevanceScore: articleDto.relevanceScore,
      locale: articleDto.locale,
    );
