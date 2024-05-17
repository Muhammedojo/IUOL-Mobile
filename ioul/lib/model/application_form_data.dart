import 'package:ioul/model/user.dart';

class ApplicationFormData {
  int? amount;
  String? paymentType;
  String? description;
  UserData? user;
  ApplicationFormData(
      {this.description, this.paymentType, this.amount, this.user});

  factory ApplicationFormData.fromJson(Map<String, dynamic> json) =>
      switch (json) {
        {
          "user": Map user,
          "amount": int amount,
          "payment_type": String paymentType,
          "description": String description,
        } =>
          ApplicationFormData(
              amount: amount,
              paymentType: paymentType,
              description: description,
              user: UserData.fromJson(json['user'])),
        _ => ApplicationFormData(),
      };
}
