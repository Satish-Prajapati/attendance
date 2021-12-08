import 'package:flutter/material.dart';
import '../globals.dart' as globals;
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InfoScreen extends StatefulWidget {
  @override
  State<InfoScreen> createState() => InfoScreenState();
}

final latitude = globals.globalLocationData?.latitude;
final longitude = globals.globalLocationData?.longitude;
final time = DateFormat('hh:mm:ss dd/MM/yyyy').format(globals.time);

class InfoScreenState extends State<InfoScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(latitude!, longitude!),
    zoom: 20.4746,
  );

  static final Marker _kGooglePlexMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Google Ple'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(latitude!, longitude!),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        body: Column(
          children: [
            Container(
              height: 200.0,
              child: GoogleMap(
                mapType: MapType.normal,
                zoomControlsEnabled: false,
                scrollGesturesEnabled: false,
                myLocationButtonEnabled: false,
                initialCameraPosition: _kGooglePlex,
                markers: {_kGooglePlexMarker},
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            Container(
              height: 400.0,
              child: Image.file(globals.globalImageFile!),
            ),
            Text(
                'Location: ${globals.globalLocationData?.latitude}/${globals.globalLocationData?.longitude}'),
            Text(DateFormat('hh:mm:ss dd/MM/yyyy').format(globals.time)),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: ElevatedButton(
                  onPressed: () {
                    print('Time: $time /n Location: $latitude, $longitude');
                    globals.isLoggedIn = false;
                    globals.globalImageFile = null;
                    globals.time = null;
                    globals.globalLocationData = null;
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
