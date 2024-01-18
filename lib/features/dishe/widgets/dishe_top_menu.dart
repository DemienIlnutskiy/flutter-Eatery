import 'package:eatery/core/constants/constants.dart';
import 'package:flutter/material.dart';

class DisheTopMenu extends StatelessWidget {
  const DisheTopMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.disheTopMenuEdgeInsetsSymmetric),
      child: Column(
        children: [
          const SizedBox(
            height: AppDimensions.disheInsertTopMenuSizedBox,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: AppDimensions.disheTopMenuIconHeight,
                  ),
                ),
                const IconButton(
                  onPressed: null,
                  // onPressed: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const MyOrderView()));
                  // },
                  icon: Icon(
                    Icons.shopping_basket_outlined,
                    size: AppDimensions.disheTopMenuIconHeight,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
