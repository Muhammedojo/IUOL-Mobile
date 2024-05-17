import 'package:ioul/model/model.dart';

class MakePaymentData {
  String? referenceId;
  String? transactionId;
  String? status;
  ApplicationFormData? applicationData;

  MakePaymentData({
    this.applicationData,
    this.referenceId,
    this.status,
    this.transactionId,
  });
}

// {
// 	"amount": 7650,
// 	"reference": "435",
// 	"transaction_id" : "45678",
// 	"request_data": {
// 		"student_registration_id": 2,
// 		"amount": 7650,
// 		"description": "100 Level First Semester Oct-Nov 2023 session  )registration fee"
// 	},
// 	"status": "pending",
// 	"date": "25-10-2023",
// 	"response_data": {
// 		"status": "pending"
// 	},
// 		"payment_type": "late-course-registration"
// }