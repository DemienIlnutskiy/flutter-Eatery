import 'package:eatery/core/constants/constants.dart';
import 'package:eatery/features/dishe/bloc/dishe_bloc.dart';
import 'package:eatery/features/dishe/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DisheTotalPrice extends StatelessWidget {
  const DisheTotalPrice(
      {Key? key,
      required this.price,
      required this.width,
      required this.theme,
      required this.disheBloc})
      : super(key: key);
  final int price;
  final double width;
  final TextTheme theme;
  final DisheBloc disheBloc;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.disheInsertTotalPriceMainSizedBox,
      child: SizedBox(
        height: AppDimensions.disheInsertTotalPriceMainSizedBox,
        child: Stack(alignment: Alignment.centerLeft, children: [
          DisheTotalPriceLeftDecoration(width: width),
          Center(
            child: Stack(alignment: Alignment.centerRight, children: [
              DisheTotalPriceInf(
                  width: width,
                  theme: theme,
                  price: price,
                  disheBloc: disheBloc),
              const DisheTotalPriceButton(),
            ]),
          ),
        ]),
      ),
    );
  }
}
