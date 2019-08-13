import 'package:first_flutter_app/models/location.dart';
import 'package:first_flutter_app/widgets/location_tile.dart';
import 'package:flutter/material.dart';

import 'package:first_flutter_app/widgets/text_section.dart';
import 'package:first_flutter_app/widgets/image_banner.dart';

class LocationDetail extends StatefulWidget {
  int locationId = 0;

  LocationDetail(this.locationId);

  @override
  State<StatefulWidget> createState() {
    return _LocationDetailState(locationId);
  }
}

class _LocationDetailState extends State<LocationDetail> {
  final int _locationId;
  Location location = Location.blank();

  _LocationDetailState(this._locationId);

  @override
  void initState() {
    super.initState();
    getLocationDetails(_locationId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageBanner(imagePath: location.url),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
            ),
            LocationTile(
              location: location,
              darkTheme: false,
            )
          ]..addAll(textSections(location)),
        ),
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

  getLocationDetails(int locationId) async {
    location = await Location.fetchById(locationId);

    if (mounted)
      setState(() {
        this.location = location;
      });
  }
}
