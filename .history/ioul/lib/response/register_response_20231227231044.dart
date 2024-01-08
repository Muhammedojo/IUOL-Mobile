// import '../helper/helper.dart';

import 'response.dart';

class RegisterResponse extends GenericResponse {
  late RegisterModel data;

  RegisterResponse(
      {String? previous,
      String? next,
      int? count,
      String? status,
      String? message,
      String? token})
      : super(
          message: message,
        );

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$AuditItemListResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AuditItemListResponseToJson(this);

//Validation Error
}

RegisterResponse _$AuditItemListResponseFromJson(Map<String, dynamic> json) {
  var obj = RegisterResponse(
    previous: json[KEY_PREVIOUS],
    next: json[KEY_NEXT],
    count: json[KEY_COUNT],
    status: json[KEY_STATUS],
    message: json[KEY_MESSAGE],
    token: json[TOKEN],
  );
  if (json.containsKey(KEY_DATA)) {
    obj.data = RegisterModel.fromJson(json[KEY_DATA]);
  }

  return obj;
}

Map<String, dynamic> _$AuditItemListResponseToJson(RegisterResponse obj) =>
    <String, dynamic>{
      KEY_COUNT: obj.count,
      KEY_NEXT: obj.next,
      KEY_PREVIOUS: obj.previous,
      KEY_MESSAGE: obj.message,
      KEY_STATUS: obj.status,
      KEY_DATA: obj.data,
      TOKEN: obj.token,
    };

// String _formatApiErrorMessage(dynamic response) {
//   //print("response: $response");
//   if (response != null) {
//     return response.toString().replaceAll("{", '').replaceAll("}", '');
//   }
//   return "";
// }
