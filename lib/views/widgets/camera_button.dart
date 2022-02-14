import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator_app/controllers/camera_provider.dart';
import 'package:palette_generator_app/views/screens/colors_display_page.dart';
import 'package:provider/provider.dart';

class CameraButton extends StatelessWidget {
  const CameraButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _takeAndUsePicture(context);
      },
      borderRadius: BorderRadius.circular(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 60,
          width: 60,
          child: Wrap(
            children: [
              Container(
                width: 30,
                height: 30,
                color: Colors.red,
              ),
              Container(
                width: 30,
                height: 30,
                color: Colors.green,
              ),
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
              Container(
                width: 30,
                height: 30,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _takeAndUsePicture(BuildContext context) async {
  CameraProvider cameraProvider = Provider.of<CameraProvider>(
    context,
    listen: false,
  );
  if (cameraProvider.controller == null) return;
  XFile imageFile = await cameraProvider.controller!.takePicture();
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ColorsDisplayPage(imageFile: File(imageFile.path)),
    ),
  );
}
