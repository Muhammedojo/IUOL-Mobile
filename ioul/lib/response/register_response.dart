// import '../helper/helper.dart';

import '../model/register_student.dart';
import 'response.dart';

class RegisterResponse extends GenericResponse {
  Register? data;

  RegisterResponse(
      {String? previous,
      String? next,
      int? count,
      String? status,
      String? message,
      // Object? data,
      String? token})
      : super(
          message: message,
          // data: data,
        );

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$AuditItemListResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AuditItemListResponseToJson(this);

//Validation Error
}

RegisterResponse _$AuditItemListResponseFromJson(Map<String, dynamic> json) {
  var obj = RegisterResponse();
  if (json.containsKey("message")) {
    obj.message = json["message"];
  }
  if (json.containsKey("data")) {
    obj.data = Register.fromJson(json["data"]);
  }

  return obj;
}

Map<String, dynamic> _$AuditItemListResponseToJson(RegisterResponse obj) =>
    <String, dynamic>{
      // KEY_COUNT: obj.count,
      // KEY_NEXT: obj.next,
      // KEY_PREVIOUS: obj.previous,
      // KEY_MESSAGE: obj.message,
      // KEY_STATUS: obj.status,
      "data": obj.data,
      // TOKEN: obj.token,
    };

// String _formatApiErrorMessage(dynamic response) {
//   //print("response: $response");
//   if (response != null) {
//     return response.toString().replaceAll("{", '').replaceAll("}", '');
//   }
//   return "";
// }
