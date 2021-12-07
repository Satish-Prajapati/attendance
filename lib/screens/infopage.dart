import 'package:flutter/material.dart';
import '../globals.dart' as globals;
import 'package:intl/intl.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Image.file(globals.globalImageFile!),
            ),
            // Text('${globals.globalLocationData}'),
            Text(
                'Location: ${globals.globalLocationData?.latitude}/${globals.globalLocationData?.longitude}'),
            Text(DateFormat('hh:mm:ss dd/MM/yyyy').format(globals.time))
          ],
        ),
      ),
    );
  }
}
