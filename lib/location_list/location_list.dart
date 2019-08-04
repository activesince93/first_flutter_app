import 'package:first_flutter_app/models/location.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class LocationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Location> locations = Location.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: ListView(
        children: locations
            .map((location) =>
            GestureDetector(
              child: Text(location.name),
              onTap: () => _onLocationTap(context, location.id)
            ))
            .toList(),
      ),
    );
  }

  _onLocationTap(BuildContext context, int locationId) {
    Navigator.pushNamed(context, LocationDetailsRoute, arguments: {"id" : locationId});
  }
}
