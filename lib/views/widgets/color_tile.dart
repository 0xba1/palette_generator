import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorTile extends StatelessWidget {
  const ColorTile({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Clipboard.setData(ClipboardData(
                text:
                    '#${color.red.toRadixString(16)}${color.green.toRadixString(16)}${color.blue.toRadixString(16)}'));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    'Copied #${color.red.toRadixString(16)}${color.green.toRadixString(16)}${color.blue.toRadixString(16)} to clipboard')));
          },
          child: SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width / 4,
          ),
        ),
      ),
    );
  }
}
