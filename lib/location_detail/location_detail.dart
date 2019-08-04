import 'package:first_flutter_app/models/location.dart';
import 'package:first_flutter_app/widgets/location_tile.dart';
import 'package:flutter/material.dart';

import 'package:first_flutter_app/widgets/text_section.dart';
import 'package:first_flutter_app/widgets/image_banner.dart';

class LocationDetail extends StatelessWidget {
  final int _locationId;

  LocationDetail(this._locationId);

  @override
  Widget build(BuildContext context) {
    final location = Location.fetchById(_locationId);
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageBanner(imagePath: location.imagePath),
          Padding(
            padding: EdgeInsets.all(16.0),
          ),
          LocationTile(
            location: location,
            darkTheme: false,
          )
        ]..addAll(textSections(location)),
      ),
    );
  }

  List<Widget> textSections(Location location) {
    return location.facts
        .map(
          (fact) => TextSection(fact.title, fact.text),
        )
        .toList();
  }
}
