
import 'package:json_annotation/json_annotation.dart';

part 'location_fact.g.dart';

@JsonSerializable()
class LocationFact {
  String title;
  String text;

  LocationFact(this.title, this.text);

  factory LocationFact.fromJson(Map<String, dynamic> json) => _$LocationFactFromJson(json);
}