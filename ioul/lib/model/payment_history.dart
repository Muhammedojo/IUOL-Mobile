import 'dart:ffi';

class PaymentsHistory {
  String? name;
  String? admissionNumber;
  int? transactionId;
  double? amount;
  String? description;
  String? date;
  String? status;
  String? paymentType;

  PaymentsHistory();

  factory PaymentsHistory.fromJson(Map<String, dynamic> json) =>
      _$PaymentsHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentsHistoryToJson(this);
}

PaymentsHistory _$PaymentsHistoryFromJson(Map<String, dynamic> json) {
  var obj = PaymentsHistory();

  obj.name = json["name"];
  obj.admissionNumber = json["admission_no"];
  obj.transactionId = json["transaction_id"];
  obj.description = json["description"];
  obj.paymentType = json["payment_type"];
  obj.amount = json["amount"];
  obj.status = json["status"];
  obj.date = json["date"];

  return obj;
}

Map<String, dynamic> _$PaymentsHistoryToJson(PaymentsHistory obj) =>
    <String, dynamic>{
      "name": obj.name,
    };
