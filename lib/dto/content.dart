class Content {
  int? contentId;
  String? contentType;
  String? title;
  String? thumbnail;

  Content({this.contentId, this.contentType, this.title, this.thumbnail});

  Content.fromJson(Map<String, dynamic> json) {
    contentId = json['contentId'];
    contentType = json['contentType'];
    title = json['title'];
    thumbnail = json['thumbnail'];
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