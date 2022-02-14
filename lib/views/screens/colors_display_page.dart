import 'dart:io';

import 'package:flutter/material.dart';
import 'package:palette_generator_app/models/palette.dart';
import 'package:palette_generator_app/views/widgets/animated_circular_progress_indicator.dart';
import 'package:palette_generator_app/views/widgets/color_tile.dart';

class ColorsDisplayPage extends StatefulWidget {
  const ColorsDisplayPage({Key? key, required this.imageFile})
      : super(key: key);
  final File imageFile;

  @override
  _ColorsDisplayPageState createState() => _ColorsDisplayPageState();
}

class _ColorsDisplayPageState extends State<ColorsDisplayPage> {
  List<Color>? colorList;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    colorList = await Palette.generatePalette(widget.imageFile);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Colors',
            style: TextStyle(color: Colors.black, fontFamily: 'raleway'),
          ),
          leading: const BackButton(color: Colors.black),
        ),
        body: colorList == null
            ? const Center(
                child: AnimatedCircularProgressIndicator(),
              )
            : Wrap(
                children: [
                  for (Color color in colorList!) ColorTile(color: color)
                ],
              ));
  }
}
