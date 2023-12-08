import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String uuid;
  final String title;
  final String description;
  final String keywords;
  final String snippet;
  final String url;
  final String imageUrl;
  final String language;
  final DateTime publishedAt;
  final String source;
  final List<String> categories;
  final dynamic relevanceScore;
  final String locale;

  const Article({
    required this.uuid,
    required this.title,
    required this.description,
    required this.keywords,
    required this.snippet,
    required this.url,
    required this.imageUrl,
    required this.language,
    required this.publishedAt,
    required this.source,
    required this.categories,
    required this.relevanceScore,
    required this.locale,
  });

  @override
  List<Object?> get props => [
        uuid,
        title,
        description,
        keywords,
        snippet,
        url,
        imageUrl,
        language,
        publishedAt,
        source,
        categories,
        relevanceScore,
        locale
      ];

  static List<Article> articles = [];
}
