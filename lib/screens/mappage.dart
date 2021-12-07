import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../globals.dart' as globals;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // final Location location = Location();
  Location location = new Location();

  late bool _serviceEnabled, _isGetLocation = false;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  _getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    globals.globalLocationData = _locationData;
    setState(() {
      _isGetLocation = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _getLocation, child: Text('Get Location')),
            if (_isGetLocation)
              Text(
                  'Location: ${_locationData.latitude}/${_locationData.longitude}'),
            if (globals.globalLocationData != null)
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/info');
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ))
          ],
        ),
      ),
    ));
  }
}
