import 'dart:developer';

class CountryData {
  String? id;
  String? name;

  CountryData({
    this.id,
    this.name,
  });
}

class CountryResponse {
  List<CountryData>? data;
  int? statusCode;
  String? message;

  CountryResponse({this.data});

  factory CountryResponse.fromJson(Map<String, dynamic> json) {
    // log("country data json: $json");
    List<CountryData> newData = [];
    json['data'].entries.forEach((item) {
      // log("key: $key");
      newData.add(
        CountryData(id: item.key, name: item.value),
      );
    });

    return CountryResponse(data: newData);
  }
}
