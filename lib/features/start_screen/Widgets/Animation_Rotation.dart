import 'package:flutter/material.dart';

class animation_rotation extends StatefulWidget {
  final String url;
  final double size;
  const animation_rotation({
    super.key,
    required this.url,
    required this.size,
  });

  @override
  State<animation_rotation> createState() => _animationRotationState();
}

class _animationRotationState extends State<animation_rotation> {
  double rotation = 0;

  // @override
  // void initState() {
  //   super.initState();
  //
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     setState(() {
  //       rotation = 10;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: rotation,
      duration: const Duration(seconds: 100),
      onEnd: () {
        setState(() {
          rotation == 10 ? rotation = 0 : rotation = 10;
        });
      },
      child: Image.asset(
        widget.url,
        width: widget.size,
      ),
    );
  }
}
