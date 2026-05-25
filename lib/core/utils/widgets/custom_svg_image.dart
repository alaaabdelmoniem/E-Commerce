import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgImage extends StatelessWidget {
  const CustomSvgImage({
    super.key,
    required this.urlImage,
    this.width,
    this.hight,
  });
  final String urlImage;
  final double? width;
  final double? hight;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(urlImage);
  }
}
