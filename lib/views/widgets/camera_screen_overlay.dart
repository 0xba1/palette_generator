import 'package:flutter/material.dart';
import 'package:palette_generator_app/controllers/camera_provider.dart';
import 'package:palette_generator_app/views/widgets/camera_button.dart';
import 'package:provider/provider.dart';

class CameraScreenOverlay extends StatelessWidget {
  const CameraScreenOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CameraProvider cameraProvider = Provider.of<CameraProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        cameraProvider.toggleCamera();
                      },
                      icon: const Icon(
                        Icons.cameraswitch_rounded,
                        size: 32,
                      ))
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              height: 26,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [CameraButton()],
              ),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ],
    );
  }
}
