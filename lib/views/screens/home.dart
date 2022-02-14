import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator_app/controllers/camera_provider.dart';
import 'package:palette_generator_app/views/screens/camera_screen_page.dart';
import 'package:palette_generator_app/views/screens/colors_display_page.dart';
import 'package:palette_generator_app/views/widgets/home_list_tile.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Pallete Generator',
          style: TextStyle(color: Colors.black, fontFamily: 'raleway'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            HomeListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (_) => CameraProvider(),
                      child: const CameraScreenPage(),
                    ),
                  ),
                );
              },
              title: 'Take picture with camera to generate color palette',
            ),
            const SizedBox(
              height: 10,
            ),
            HomeListTile(
              onTap: () {
                pickAndUseImage(context);
              },
              title: 'Pick image from gallery to generate color palette',
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> pickAndUseImage(BuildContext context) async {
  final ImagePicker imagePicker = ImagePicker();
  final XFile? imageFile =
      await imagePicker.pickImage(source: ImageSource.gallery);
  if (imageFile == null) return;
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ColorsDisplayPage(imageFile: File(imageFile.path)),
    ),
  );
}
