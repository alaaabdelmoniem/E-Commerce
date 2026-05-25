import 'package:flutter/material.dart';

class ImageLoadingState extends StatefulWidget {
  const ImageLoadingState({super.key, this.hight, this.width, this.borderRadius});
  final double? hight;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  @override
  State<ImageLoadingState> createState() => _CategoryLoadingState();
}

class _CategoryLoadingState extends State<ImageLoadingState>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.3, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        height: widget.hight,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
