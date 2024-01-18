import 'package:eatery/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class DisheTitle extends StatelessWidget {
  const DisheTitle({Key? key, required this.name, required this.theme})
      : super(key: key);
  final String name;
  final TextTheme theme;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.disheEdgeInsetsSymmetric),
      child: Text(
        name,
        style: theme.labelLarge,
      ),
    );
  }
}
