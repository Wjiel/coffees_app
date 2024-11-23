import 'package:flutter/material.dart';

class AnimationRotation extends StatefulWidget {
  final String url;
  final double size;
  const AnimationRotation({
    super.key,
    required this.url,
    required this.size,
  });

  @override
  State<AnimationRotation> createState() => _animationRotationState();
}

class _animationRotationState extends State<AnimationRotation> {
  double rotation = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        rotation = 10;
      });
    });
  }

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
