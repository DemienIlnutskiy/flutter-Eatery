import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/constants/constants.dart';

class DisheInfo extends StatelessWidget {
  const DisheInfo(
      {Key? key, required this.theme, required this.rank, required this.price})
      : super(key: key);

  final TextTheme theme;
  final String rank;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.disheEdgeInsetsSymmetric),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IgnorePointer(
                ignoring: true,
                child: RatingBar.builder(
                  initialRating: double.parse(rank),
                  minRating: AppDimensions.disheRBMinRating,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: AppDimensions.disheRBItemCount,
                  itemSize: AppDimensions.disheRBItemSize,
                  itemPadding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.disheRBEdgeInsetsSymmetric),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: AppColors.orange,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ),
            ],
          ),
          Text(
            price,
            style: theme.labelLarge,
          ),
        ],
      ),
    );
  }
}
