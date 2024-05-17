class RegisteredCourse {
  int? id;
  int? admissionId;
  int? courseId;
  int? programmeLevelId;
  String? semester;
  int? sessionId;
  int? totalMark;
  String? grade;
  int? releaseResult;

  RegisteredCourse(
      {this.admissionId,
      this.courseId,
      this.id,
      this.programmeLevelId,
      this.grade,
      this.releaseResult,
      this.semester,
      this.sessionId,
      this.totalMark});

  factory RegisteredCourse.fromJson(Map<String, dynamic> json) {
    return RegisteredCourse(
      admissionId: json['admission_id'],
      courseId: json['course_id'],
      id: json['id'],
      programmeLevelId: json['programme_level_id'],
      grade: json['grade'],
      releaseResult: json['release_result'],
      semester: json['semester'],
      sessionId: json['session_id'],
      totalMark: json['total_marks'],
    );
  }
}
