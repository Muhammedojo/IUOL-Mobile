// import '../helper/helper.dart';

import 'response.dart';

class BalanceResponse extends GenericResponse {
  late BalanceModel data;

  BalanceResponse(
      {String? previous,
      String? next,
      int? count,
      String? status,
      String? message,
      String? token})
      : super(
          previous: previous,
          next: next,
          count: count,
          status: status,
          message: message,
          token: token,
        );

  factory BalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$AuditItemListResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AuditItemListResponseToJson(this);

//Validation Error
}

BalanceResponse _$AuditItemListResponseFromJson(Map<String, dynamic> json) {
  var obj = BalanceResponse(
    previous: json[KEY_PREVIOUS],
    next: json[KEY_NEXT],
    count: json[KEY_COUNT],
    status: json[KEY_STATUS],
    message: json[KEY_MESSAGE],
    token: json[TOKEN],
  );
  if (json.containsKey(KEY_DATA)) {
    obj.data = BalanceModel.fromJson(json[KEY_DATA]);
  }

  return obj;
}

Map<String, dynamic> _$AuditItemListResponseToJson(BalanceResponse obj) =>
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
