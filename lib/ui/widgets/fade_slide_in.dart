import 'package:flutter/material.dart';

class FadeSlideIn extends StatelessWidget {
  final Widget child;
  final AnimationController controller;
  final double start;
  final double end;
  final double slideOffset;

  const FadeSlideIn({
    super.key,
    required this.child,
    required this.controller,
    required this.start,
    required this.end,
    this.slideOffset = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    final opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(start, end, curve: Curves.easeOut),
      ),
    );

    final slide = Tween<double>(begin: slideOffset, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(start, end, curve: Curves.easeOutCubic),
      ),
    );

    return AnimatedBuilder(
      animation: controller,
      builder: (context, childWidget) {
        return Transform.translate(
          offset: Offset(0, slide.value),
          child: Opacity(
            opacity: opacity.value,
            child: childWidget,
          ),
        );
      },
      child: child,
    );
  }
}