class ApplicationPayment {
  String? amount;
  String? description;
  String? paymentUrl;

  ApplicationPayment();

  factory ApplicationPayment.fromJson(Map<String, dynamic> json) =>
      _$ApplicationPaymentFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationPaymentToJson(this);
}

ApplicationPayment _$ApplicationPaymentFromJson(Map<String, dynamic> json) {
  var obj = ApplicationPayment();

  obj.amount = json["amount"];
  obj.description = json["description"];
  obj.paymentUrl = json["payment_url"];

  return obj;
}

Map<String, dynamic> _$ApplicationPaymentToJson(ApplicationPayment obj) =>
    <String, dynamic>{
      "amount": obj.amount,
      "description": obj.description,
      "payment_url": obj.paymentUrl,
    };
