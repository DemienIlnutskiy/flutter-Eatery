import 'package:eatery/core/constants/constants.dart';
import 'package:flutter/material.dart';

class DisheTotalPriceLeftDecoration extends StatelessWidget {
  const DisheTotalPriceLeftDecoration({Key? key, required this.width})
      : super(key: key);

  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * AppDimensions.disheTotalPriceDecorationContainerWidth,
      height: AppDimensions.disheTotalPriceDecorationContainerHeight,
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.only(
            topRight:
                Radius.circular(AppDimensions.disheTotalPriceBorderRadius),
            bottomRight:
                Radius.circular(AppDimensions.disheTotalPriceBorderRadius)),
      ),
    );
  }
}
