class Collection {
  String? title;
  String? subjectArea;
  String? url;

  Collection({
    this.title,
    this.subjectArea,
    this.url,
  });

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      title: json['title'],
      subjectArea: json['subject_area'],
      url: json['url'],
    );
  }
}
