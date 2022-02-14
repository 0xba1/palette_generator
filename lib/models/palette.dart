import 'dart:io';

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class Palette {
  static Future<List<Color>> generatePalette(File imageFile) async {
    final ImageProvider imageProvider = FileImage(imageFile);
    PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    List<Color> list = paletteGenerator.colors.toList();
    return list;
  }
}
