import 'dart:convert';

/// id : null
/// name : "TMZ"

SourceModel sourceFromJson(String str) => SourceModel.fromJson(json.decode(str));
String sourceToJson(SourceModel data) => json.encode(data.toJson());
class SourceModel {
  dynamic id;
  String? name;

  SourceModel({
      this.id, 
      this.name,});

  SourceModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}