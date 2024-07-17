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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SummaryCourse && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  factory SummaryCourse.fromJson(Map<String, dynamic> json) {
    return SummaryCourse(
      code: json['code'],
      title: json['title'],
      id: json['id'],
      units: json['units'],
    );
  }
}
