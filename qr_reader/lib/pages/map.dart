import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_reader/providers/db.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapType mapType = MapType.normal;
  Set<Marker> marker = Set<Marker>();

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)?.settings.arguments as ScanModel;

    final Completer<GoogleMapController> _controller = Completer();

    final CameraPosition startingPoint =
        CameraPosition(target: scan.getLatLng(), zoom: 17);

    marker.add(
      Marker(
        markerId: MarkerId("geo-location-live"),
        position: scan.getLatLng(),
        infoWindow: const InfoWindow(title: 'Stranges'),
      ),
    );

    Set<Marker> markers = Set<Marker>();
    markers.add(Marker(
      markerId: MarkerId("geo-location"),
      position: scan.getLatLng(),
    ));

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(target: scan.getLatLng(), zoom: 17)));
            })
      ]),
      body: GoogleMap(
        myLocationEnabled: true,
        markers: marker,
        mapType: mapType,
        onTap: (LatLng data) async {
          BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(),
            "assets/icons/alfiler.png",
          );
          setState(() {
            marker.add(
              Marker(
                  markerId: MarkerId("geo-location-live"),
                  position: data,
                  infoWindow: const InfoWindow(title: 'Stranges'),
                  icon: markerbitmap),
            );
          });
        },
        initialCameraPosition: startingPoint,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else {
            mapType = MapType.normal;
          }

          setState(() {});
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }

  Future<BitmapDescriptor> loadIconMarker() async {
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/icons/alfiler.png",
    );
    return markerbitmap;
  }
}
