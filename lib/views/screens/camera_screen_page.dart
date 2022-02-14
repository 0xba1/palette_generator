import 'package:flutter/material.dart';
import 'package:palette_generator_app/views/widgets/camera_screen.dart';
import 'package:palette_generator_app/views/widgets/camera_screen_overlay.dart';

class CameraScreenPage extends StatelessWidget {
  const CameraScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [CameraScreen(), CameraScreenOverlay()],
      ),
    );
  }
}
