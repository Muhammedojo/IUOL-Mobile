class SummaryCourse {
  String? code;
  String? title;
  int? id;
  int? units;

  SummaryCourse({
    this.code,
    this.title,
    this.id,
    this.units,
  });

  factory SummaryCourse.fromJson(Map<String, dynamic> json) {
    return SummaryCourse(
      code: json['code'],
      title: json['title'],
      id: json['id'],
      units: json['units'],
    );
  }
}
