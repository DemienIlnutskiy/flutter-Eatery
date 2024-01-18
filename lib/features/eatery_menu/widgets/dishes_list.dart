import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eatery/core/config/router/router.dart';
import 'package:eatery/core/constants/constants.dart';
import 'package:eatery/core/repositories/eatery_menu/models/models.dart';
import 'package:flutter/material.dart';

class DishesList extends StatelessWidget {
  const DishesList(
      {super.key,
      required this.width,
      required this.height,
      required this.dishe});

  final double width;
  final double height;
  final MenuDishe dishe;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppDimensions.dishesMargin),
      child: InkWell(
        key: const Key('list'),
        onTap: () => AutoRouter.of(context).push(DisheRoute(dishe: dishe)),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CachedNetworkImage(
              imageUrl: dishe.image,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
            Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                AppColors.transparent,
                AppColors.transparent,
                AppColors.black
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.dishesPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dishe.name,
                        textAlign: TextAlign.center,
                        style: theme.displayLarge,
                      ),
                      const SizedBox(
                        height: AppDimensions.dishesSpace,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: AppColors.orange,
                                size: AppFont.fontLableMedium,
                              ),
                              const SizedBox(
                                width: AppDimensions.dishesSpace,
                              ),
                              Text(dishe.rank,
                                  textAlign: TextAlign.center,
                                  style: theme.headlineMedium),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.timer,
                                  color: AppColors.lightGray,
                                  size: AppFont.fontLableMedium),
                              const SizedBox(
                                width: AppDimensions.dishesSpace,
                              ),
                              if (dishe.cookingTime != AppStrings.checkEmpty)
                                Text(
                                  dishe.cookingTime,
                                  textAlign: TextAlign.center,
                                  style: theme.displayMedium,
                                ),
                              if (dishe.cookingTime == AppStrings.checkEmpty)
                                Text(
                                  AppStrings.stringEmpty,
                                  textAlign: TextAlign.center,
                                  style: theme.titleMedium,
                                ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                dishe.number.toString() +
                                    AppStrings.priceSymbol,
                                textAlign: TextAlign.center,
                                style: theme.displayMedium,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                dishe.price.toString() + AppStrings.priceSymbol,
                                textAlign: TextAlign.center,
                                style: theme.displayMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
