import 'package:first_flutter_app/models/location.dart';
import 'package:first_flutter_app/widgets/location_tile.dart';
import 'package:flutter/material.dart';

class TileOverlay extends StatelessWidget {
  final Location _location;

  TileOverlay(this._location);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: LocationTile(_location, false),
        )
      ],
    );
  }
}
