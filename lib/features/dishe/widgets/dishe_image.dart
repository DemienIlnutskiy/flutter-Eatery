import 'package:flutter/material.dart';

class DisheImage extends StatelessWidget {
  const DisheImage({Key? key, required this.image, required this.width})
      : super(key: key);
  final String image;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      width: width,
      height: width,
      fit: BoxFit.cover,
    );
  }
}
