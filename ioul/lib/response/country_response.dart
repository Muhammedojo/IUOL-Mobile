class CountryData {
  int? id;
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
    List<CountryData> data =
        json['data'].forEach((key, value) => CountryData(id: key, name: value));

    return CountryResponse(data: data);
  }
}
