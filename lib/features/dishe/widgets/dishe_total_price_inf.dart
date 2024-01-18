import 'package:eatery/core/constants/constants.dart';
import 'package:eatery/features/dishe/bloc/dishe_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisheTotalPriceInf extends StatelessWidget {
  const DisheTotalPriceInf(
      {Key? key,
      required this.width,
      required this.theme,
      required this.price,
      required this.disheBloc})
      : super(key: key);
  final double width;
  final TextTheme theme;
  final int price;
  final DisheBloc disheBloc;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
            top: AppDimensions.disheTotalPriceContainerVerticalMargin,
            bottom: AppDimensions.disheTotalPriceContainerVerticalMargin,
            left: AppDimensions.disheTotalPriceContainerLeftMargin,
            right: AppDimensions.disheTotalPriceContainerRightMargin),
        width: width - AppDimensions.disheTotalPriceContainerWidth,
        height: AppDimensions.disheTotalPriceContainerHeight,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft:
                  Radius.circular(AppDimensions.disheTotalPriceBorderRadius),
              bottomLeft:
                  Radius.circular(AppDimensions.disheTotalPriceBorderRadius),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: AppDimensions.disheNumberBorderRadius,
                  offset: Offset(
                      AppDimensions.disheNumberSizedBoxNull,
                      AppDimensions
                          .disheTotalPriceShadowContainerOffsetSecondNumber))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppStrings.disheTotalPrice,
              style: theme.labelSmall,
            ),
            const SizedBox(
              height: AppDimensions.disheInsertTotalPriceSizedBox,
            ),
            BlocBuilder<DisheBloc, int>(
              bloc: disheBloc,
              builder: (context, state) {
                return Text(
                    (price * state.toInt()).toString() + AppStrings.priceSymbol,
                    style: theme.labelLarge);
              },
            ),
            const SizedBox(
              height: AppDimensions.disheInsertTotalPriceSizedBox,
            ),
            //add to cart
            //need to change element decoration
            SizedBox(
              width: width,
              child: const Icon(
                Icons.card_giftcard,
                color: AppColors.black,
                size: AppDimensions.disheTotalPriceIconHeight,
              ),
            )
          ],
        ));
  }
}
