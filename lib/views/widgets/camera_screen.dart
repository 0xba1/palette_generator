import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator_app/controllers/camera_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    CameraProvider cameraProvider =
        Provider.of<CameraProvider>(context, listen: false);
    if (await Permission.camera.request().isGranted) {
      cameraProvider.permissionIsGranted = true;
    }
    cameraProvider.cameras = await availableCameras();
    cameraProvider.controller = CameraController(
        cameraProvider.cameras![cameraProvider.cameraIndex],
        ResolutionPreset.medium);
    cameraProvider.initializeControllerFuture =
        cameraProvider.controller!.initialize();
  }

  @override
  Widget build(BuildContext context) {
    CameraProvider cameraProvider = Provider.of<CameraProvider>(context);
    if (cameraProvider.initializeControllerFuture == null ||
        cameraProvider.controller == null ||
        !cameraProvider.permissionIsGranted) {
      return Container(
        color: const Color(0xFF0A0C14),
      );
    }
    return FutureBuilder(
        future: cameraProvider.initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final mediaSize = MediaQuery.of(context).size;
            final scale = 1 /
                (cameraProvider.controller!.value.aspectRatio *
                    mediaSize.aspectRatio);

            return ClipRect(
              clipper: _MediaSizeClipper(mediaSize),
              child: Transform.scale(
                scale: scale,
                alignment: Alignment.topCenter,
                child: CameraPreview(cameraProvider.controller!),
              ),
            );
          } else {
            return Container(
              color: const Color(0xFF0A0C14),
            );
          }
        });
  }
}

class _MediaSizeClipper extends CustomClipper<Rect> {
  final Size mediaSize;
  const _MediaSizeClipper(this.mediaSize);
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, mediaSize.width, mediaSize.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
