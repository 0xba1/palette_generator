import 'package:flutter/material.dart';

class AnimatedCircularProgressIndicator extends StatelessWidget {
  const AnimatedCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: ColorTween(begin: Colors.red, end: Colors.blue),
      duration: const Duration(milliseconds: 2000),
      builder: (context, value, _) =>
          CircularProgressIndicator(color: value as Color),
    );
  }
}
