import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

import '../endpoint.dart';
import './location_fact.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  final int id;
  final String name;
  final String url;
  final String userItinerarySummary;
  final String tourPackageName;
  final List<LocationFact> facts;

  Location({
    this.id,
    this.name,
    this.url,
    this.userItinerarySummary,
    this.tourPackageName,
    this.facts,
  });

  Location.blank()
      :
        id = 0,
        name = '',
        url = '',
        userItinerarySummary = '',
        tourPackageName = '',
        facts = List<LocationFact>();

  factory Location.fromJson(Map<String, dynamic> json) =>_$LocationFromJson(json);

  static Future<List<Location>> fetchAll() async {
    var uri = EndPoint.uri('/locations');
    final resp = await http.get(uri.toString());

    if(resp.statusCode != 200) {
      throw resp.body;
    }

    List<Location> locationList = List<Location>();
    for(var jsonItem in json.decode(resp.body)) {
      locationList.add(Location.fromJson(jsonItem));
    }
    return locationList;
  }

  static Future<Location> fetchById(int id) async {
    var uri = EndPoint.uri('/locations/$id');
    final resp = await http.get(uri.toString());

    if(resp.statusCode != 200) {
      throw resp.body;
    }

    final Map<String, dynamic> jsonItem = jsonDecode(resp.body);
    return Location.fromJson(jsonItem);
  }
}
