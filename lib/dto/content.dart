class Content {
  final int contentId;
  final String contentType;
  final String title;
  final String thumbnail;

  Content({required this.contentId,  required this.contentType,  required this.title,  required this.thumbnail});

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
        contentId: json['contentId'],
        contentType:  json['contentType'],
        title: json['title'],
        thumbnail: json['thumbnail']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contentId'] = this.contentId;
    data['contentType'] = this.contentType;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}