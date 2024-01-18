import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DisheImage extends StatelessWidget {
  const DisheImage({Key? key, required this.image, required this.width})
      : super(key: key);
  final String image;
  final double width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      width: width,
      height: width,
      fit: BoxFit.cover,
    );
  }
}
