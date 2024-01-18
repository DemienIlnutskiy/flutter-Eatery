import 'package:eatery/core/constants/constants.dart';
import 'package:flutter/material.dart';

class DisheTotalPriceButton extends StatelessWidget {
  const DisheTotalPriceButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      // onTap: () {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) =>
      //               const MyOrderView()));
      // },
      child: Container(
        width: AppDimensions.disheTotalPriceShadowContainerSize,
        height: AppDimensions.disheTotalPriceShadowContainerSize,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
                AppDimensions.disheTotalPriceBorderRadius),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius:
                      AppDimensions.disheTotalPriceShadowContainerBlurRadius,
                  offset: Offset(
                      AppDimensions
                          .disheTotalPriceShadowContainerOffsetFirstNumber,
                      AppDimensions
                          .disheTotalPriceShadowContainerOffsetSecondNumber))
            ]),
        alignment: Alignment.center,
        child: const Icon(
          Icons.shopping_basket_outlined,
          color: AppColors.black,
          size: AppDimensions.disheTotalPriceIconHeight,
        ),
      ),
    );
  }
}
