import 'package:first_flutter_app/widgets/image_banner.dart';
import 'package:first_flutter_app/models/location.dart';
import 'package:first_flutter_app/location_list/tile_overlay.dart';
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
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) =>
            _itemBuilder(context, locations[index]),
      ),
    );
  }

  _onLocationTap(BuildContext context, int locationId) {
    Navigator.pushNamed(context, LocationDetailsRoute,
        arguments: {"id": locationId});
  }

  Widget _itemBuilder(BuildContext context, Location location) {
    return GestureDetector(
        child: Stack(
            children: [
              ImageBanner(location.imagePath),
              TileOverlay(location)
            ]
        ),
        onTap: () => _onLocationTap(context, location.id));
  }
}
