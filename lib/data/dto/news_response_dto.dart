import 'article_dto.dart';
import 'meta_dto.dart';

class NewsResponseDto {
  MetaDto metaDto;
  List<ArticleDto> dataDto;

  NewsResponseDto({required this.metaDto, required this.dataDto});

  factory NewsResponseDto.fromJson(Map<String, dynamic> json) {
    return NewsResponseDto(
      metaDto: MetaDto.fromJson(json['meta']),
      dataDto: List<ArticleDto>.from(json['data'].map((article) => ArticleDto.fromJson(article))),
    );
  }
}
