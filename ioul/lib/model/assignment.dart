class Assignment {
  String? title;
  String? startDate;
  String? endDate;
  String? assignmentQuestion;
  String? assignmentDescription;
  String? assignmentRubrics;
  String? assignmentTemplate;
  bool? hasSubmittedAssignment;
  String? assignmentFile;
  int? studentAssignmentId;

  Assignment();

  factory Assignment.fromJson(Map<String, dynamic> json) =>
      _$AssignmentFromJson(json);
  Map<String, dynamic> toJson() => _$AssignmentToJson(this);
}

Assignment _$AssignmentFromJson(Map<String, dynamic> json) {
  var obj = Assignment();

  obj.studentAssignmentId = json["student_assignment_id"];
  obj.title = json["title"];
  obj.startDate = json["start_date"];
  obj.endDate = json["end_date"];
  obj.assignmentDescription = json["assignment_description"];
  obj.assignmentFile = json["assignment_file"];
  obj.assignmentQuestion = json["assignment_question"];
  obj.assignmentRubrics = json["assignment_rubrics"];
  obj.assignmentTemplate = json["assignment_template"];
  obj.hasSubmittedAssignment = json["has_submitted_assignment"];

  return obj;
}

Map<String, dynamic> _$AssignmentToJson(Assignment obj) => <String, dynamic>{
      "student_assignment_id": obj.studentAssignmentId,
      "title": obj.title,
      "start_date": obj.startDate,
      "end_date": obj.endDate,
      "assignment_description": obj.assignmentDescription,
      "assignment_file": obj.assignmentFile,
      "assignment_question": obj.assignmentQuestion,
      "assignment_rubrics": obj.assignmentRubrics,
      "assignment_template": obj.assignmentTemplate,
      "has_submitted_assignment": obj.hasSubmittedAssignment,
    };
