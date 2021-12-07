import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../globals.dart' as globals;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? imageFile;
  // final picker = ImagePicker();

  _getImageFromCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    // if (imageFile == null) return;
    // File tmpFile = File(imageFile.path);
    // final appDir = await getApplicationDocumentsDirectory();
    // final fileName = basename(imageFile.path);
    // tmpFile = await tmpFile.copy('${appDir.path}/$fileName');
    // print('File path is :${tmpFile.path}');
    setState(() {
      imageFile = File(image!.path);
    });
    globals.globalImageFile = File(image!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          imageFile != null
              ? Container(
                  child: Image.file(imageFile!),
                )
              : Container(
                  child: Icon(
                    Icons.camera_enhance_rounded,
                    color: Colors.green,
                    size: MediaQuery.of(context).size.width * .6,
                  ),
                ),
          Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
              child: ElevatedButton(
                //   child: Text('Capture Image'),
                // ),
                onPressed: () {
                  _getImageFromCamera();
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child: Text(
                  imageFile != null ? 'Capture Again' : 'Capture Image',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              )),
          if (imageFile != null)
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ))
        ],
      ),
    );
  }
}
