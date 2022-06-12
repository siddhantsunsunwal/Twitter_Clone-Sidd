import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  File _profileImage;
  File _bannerImage;
  final picker = ImagePicker();
  String name = '';

  Future getImage(int type) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null && type == 0) {
        _profileImage = File(pickedFile.path);
      }
      if (pickedFile != null && type == 1) {
        _bannerImage = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: const [TextButton(onPressed: null, child: Text('Save'))]),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
            child: Column(
          children: [
            TextButton(
              onPressed: () => getImage(0),
              child: _profileImage == null
                  ? const Icon(Icons.person)
                  : Image.file(
                      _profileImage,
                      height: 100,
                    ),
            ),
            TextButton(
              onPressed: () => getImage(1),
              child: _bannerImage == null
                  ? const Icon(Icons.person)
                  : Image.file(
                      _bannerImage,
                      height: 100,
                    ),
            ),
            TextFormField(
                onChanged: (value) => setState(() {
                      name = value;
                    }))
          ],
        )),
      ),
    );
  }
}
