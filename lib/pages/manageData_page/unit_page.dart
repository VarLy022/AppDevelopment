import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UnitPage extends StatefulWidget {
  const UnitPage({super.key});

  @override
  State<UnitPage> createState() => _UnitPageState();
}

class _UnitPageState extends State<UnitPage> {
  File? _file;
  ImagePicker imgPicker = ImagePicker();

  Future<void> fetchPhoto(ImageSource source) async {
    try {
      var obj = await imgPicker.pickImage(
        maxHeight: 800,
        maxWidth: 800,
        source: source);
      if (obj != null) {
        setState(() {
          _file = File(obj.path);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void selectMenuImage() {
    showModalBottomSheet(
        context: context,
        builder: (c) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 130,
            child: Column(
              children: [
                Text(
                  "ເລືອກຮູບ",
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 350,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: Icon(
                            Icons.camera_alt,
                            color: Colors.teal,
                          ),
                          title: Text(
                            "Camera",
                            style: TextStyle(fontSize: 22),
                          ),
                          onTap: () {
                            fetchPhoto(ImageSource.camera);
                            // Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: Icon(
                            Icons.image,
                            color: Colors.teal,
                          ),
                          title: Text(
                            "Gallery",
                            style: TextStyle(fontSize: 22),
                          ),
                          onTap: () {
                            fetchPhoto(ImageSource.gallery);
                            // Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unit"),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: _file != null
                  ? Image.file(_file as File)
                  : Image.asset("assets/images/image.png"),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  selectMenuImage();
                },
                icon: Icon(
                  Icons.camera_alt,
                  size: 45,
                  color: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
