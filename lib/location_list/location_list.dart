import 'package:first_flutter_app/widgets/image_banner.dart';
import 'package:first_flutter_app/models/location.dart';
import 'package:first_flutter_app/location_list/tile_overlay.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class LocationList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LocationListState();
  }
}

class _LocationListState extends State<LocationList> {
  List<Location> locations = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: RefreshIndicator(
        child: Column(
          children: [
            renderProgressbar(context),
            Expanded(
              child: renderListView(context),
            ),
          ],
        ),
        onRefresh: loadData,
      ),
    );
  }

  Future<void> loadData() async {
    setState(() {
      this.loading = true;
    });
    final locations = await Location.fetchAll();
    setState(() {
      this.loading = false;
      this.locations = locations;
    });
  }

  _onLocationTap(BuildContext context, int locationId) {
    Navigator.pushNamed(
      context,
      LocationDetailsRoute,
      arguments: {"id": locationId},
    );
  }

  Widget _itemBuilder(BuildContext context, Location location) {
    return GestureDetector(
      onTap: () => _onLocationTap(context, location.id),
      child: Container(
        height: 245.0,
        child: Stack(
          children: [
            ImageBanner(imagePath: location.url, height: 245.0),
            TileOverlay(location),
          ],
        ),
      ),
    );
  }

  Widget renderListView(BuildContext context) {
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) => _itemBuilder(
            context,
            locations[index],
          ),
    );
  }

  Widget renderProgressbar(BuildContext context) {
    return (this.loading)
        ? LinearProgressIndicator(
            value: null,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey))
        : Container();
  }
}
