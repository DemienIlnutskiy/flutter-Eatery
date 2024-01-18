import 'package:eatery/core/constants/constants.dart';
import 'package:flutter/material.dart';

class DisheDescriptions extends StatelessWidget {
  const DisheDescriptions(
      {Key? key, required this.theme, required this.description})
      : super(key: key);
  final TextTheme theme;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.disheEdgeInsetsSymmetric),
      child: Text(
        description,
        style: theme.labelSmall,
      ),
    );
  }
}
