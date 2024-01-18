import 'package:eatery/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ImageShadow extends StatelessWidget {
  const ImageShadow({Key? key, required this.width, required this.height})
      : super(key: key);
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.blackGray,
          AppColors.transparent,
          AppColors.blackGray
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
    );
  }
}
