import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  // this list will show makers on map
  final List<Marker> _marker = [];

  // this list is the number of marker to show on map
  final List<Marker> _list = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(45.9382, 6.0910),
      infoWindow: InfoWindow(title: 'Epagny'),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(46.2044, 6.1432),
      infoWindow: InfoWindow(title: 'Geneva'),
    ),
  ];

  //Initial Position
  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(45.9382, 6.0910), zoom: 14);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Location'),
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_marker),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
