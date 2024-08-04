class NasaPictures {
  final String title;
  final String explanation;
  final String url;
  final String? thumbnailUrl;

  NasaPictures(
      {required this.title,
      required this.explanation,
      required this.url,
      this.thumbnailUrl});

  factory NasaPictures.fromJson(Map<String, dynamic> json) {
    return NasaPictures(
        title: json['title'],
        explanation: json['explanation'],
        url: json['thumbnail_url'] ?? json['url'],
        thumbnailUrl: json['thumbnail_url']);
  }
}
