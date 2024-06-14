import '../core/core.dart';

class PaymentHistoryResponse {
  int? statusCode;
  String? message;
  List<PaymentsHistory>? transactions;

  PaymentHistoryResponse({
    this.statusCode,
    this.message,
    this.transactions,
  });

  factory PaymentHistoryResponse.fromJson(Map<String, dynamic> json) {
    return PaymentHistoryResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      transactions: (json['data']['transactions'] as List)
          .map((item) => PaymentsHistory.fromJson(item))
          .toList(),
    );
  }
}
