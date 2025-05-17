class NewsResponse {
  Meta? meta;
  List<Article>? data;

  NewsResponse({this.meta, this.data});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      data: json['data'] != null
          ? List<Article>.from(json['data'].map((item) => Article.fromJson(item)))
          : [],
    );
  }
}

class Meta {
  int? found, returned, limit, page;

  Meta({this.found, this.returned, this.limit, this.page});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      found: json['found'],
      returned: json['returned'],
      limit: json['limit'],
      page: json['page'],
    );
  }
}

class Article {
  String? uuid, title, description, snippet, url, imageUrl, publishedAt, source;
  List<String>? categories;

  Article({
    this.uuid,
    this.title,
    this.description,
    this.snippet,
    this.url,
    this.imageUrl,
    this.publishedAt,
    this.source,
    this.categories,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      uuid: json['uuid'],
      title: json['title'],
      description: json['description'],
      snippet: json['snippet'],
      url: json['url'],
      imageUrl: json['image_url'],
      publishedAt: json['published_at'],
      source: json['source'],
      categories: json['categories'] != null
          ? List<String>.from(json['categories'])
          : [],
    );
  }
}
