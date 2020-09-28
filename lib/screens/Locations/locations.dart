import 'package:flutter/material.dart';
import '../../App.dart';
import '../../models/location.dart';
import '../../widgets/ImageBanner.dart';
import '../../screens/Locations/TileOverlay.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: Text("Locations"),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) =>
              _itemBuilder(context, locations[index])),
    );
  }

  _onLocationTap(BuildContext context, int locationID) {
    Navigator.pushNamed(context, LocationDetailRoute,
        arguments: {'id': locationID});
  }

  Widget _itemBuilder(BuildContext context, Location location) {
    return GestureDetector(
      onTap: () => _onLocationTap(context, location.id),
      child: Container(
        height: 245.0,
        child: Stack(
          children: [
            ImageBanner(
                assetPath: location.imagePath, height: 245.0),
            TileOverlay(location),
          ],
        ),
      ),
    );
  }
}
