class ArticleDto {
  String uuid;
  String title;
  String description;
  String keywords;
  String snippet;
  String url;
  String imageUrl;
  String language;
  DateTime publishedAt;
  String source;
  List<String> categories;
  dynamic relevanceScore;
  String locale;

  ArticleDto({
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

  factory ArticleDto.fromJson(Map<String, dynamic> json) {
    return ArticleDto(
      uuid: json['uuid'],
      title: json['title'],
      description: json['description'],
      keywords: json['keywords'],
      snippet: json['snippet'],
      url: json['url'],
      imageUrl: json['image_url'],
      language: json['language'],
      publishedAt: DateTime.parse(json['published_at']),
      source: json['source'],
      categories: List<String>.from(json['categories']),
      relevanceScore: json['relevance_score'],
      locale: json['locale'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'title': title,
      'description': description,
      'keywords': keywords,
      'snippet': snippet,
      'url': url,
      'image_url': imageUrl,
      'language': language,
      'published_at': publishedAt.toIso8601String(),
      'source': source,
      'categories': categories,
      'relevance_score': relevanceScore,
      'locale': locale,
    };
  }
}
