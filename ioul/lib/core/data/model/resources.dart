class Resources {
  int? documentResources;
  int? videoResources;
  int? audioResources;

  Resources();

  factory Resources.fromJson(Map<String, dynamic> json) =>
      _$ResourcesFromJson(json);
  Map<String, dynamic> toJson() => _$ResourcesToJson(this);
}

Resources _$ResourcesFromJson(Map<String, dynamic> json) {
  var obj = Resources();

  obj.documentResources = json["document-resources"];
  obj.videoResources = json["video-resources"];
  obj.audioResources = json["audio-resources"];

  return obj;
}

Map<String, dynamic> _$ResourcesToJson(Resources obj) => <String, dynamic>{
      "document-resources": obj.documentResources,
      "video-resources": obj.videoResources,
      "audio-resources": obj.audioResources,
    };
