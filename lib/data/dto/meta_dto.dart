class MetaDto {
  int found;
  int returned;
  int limit;
  int page;

  MetaDto({required this.found, required this.returned, required this.limit, required this.page});

  factory MetaDto.fromJson(Map<String, dynamic> json) {
    return MetaDto(
      found: json['found'],
      returned: json['returned'],
      limit: json['limit'],
      page: json['page'],
    );
  }
}
