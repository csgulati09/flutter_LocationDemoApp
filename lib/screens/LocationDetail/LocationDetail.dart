import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../widgets/ImageBanner.dart';
import 'TextSection.dart';
import '../../models/location.dart';
import '../../widgets/LocationTile.dart';

class LocationDetail extends StatelessWidget {
  final int _locationID;

  LocationDetail(this._locationID);

  @override
  Widget build(BuildContext context) {
    final location = Location.fetchByID(_locationID);

    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ImageBanner(assetPath: location.imagePath),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 4.0),
                child: LocationTile(
                  location: location,
                ),
              )
            ]..addAll(textSelections(location))),
      ),
    );
  }

  List<Widget> textSelections(Location location) {
    return location.facts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList();
  }
}
