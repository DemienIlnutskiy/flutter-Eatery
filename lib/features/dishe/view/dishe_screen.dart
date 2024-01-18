import 'package:auto_route/auto_route.dart';
import 'package:eatery/core/repositories/eatery_menu/models/menu_dishes.dart';
import 'package:eatery/features/dishe/bloc/dishe_bloc.dart';
import 'package:eatery/features/dishe/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:eatery/core/constants/constants.dart';

//Сторінка опису вибраної страви

@RoutePage()
class DisheScreen extends StatelessWidget {
  const DisheScreen({super.key, required this.dishe});

  final MenuDishe dishe;

  @override
  Widget build(BuildContext context) {
    final disheBloc = DisheBloc();
    var width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          DisheImage(image: dishe.image, width: width),
          ImageShadow(width: width, height: width),
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.all(AppDimensions.disheNumberSizedBoxNull),
              child: Column(children: [
                Column(children: [
                  SizedBox(
                    height: width,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                AppDimensions.disheBoxDecorationRadius),
                            topRight: Radius.circular(
                                AppDimensions.disheBoxDecorationRadius))),
                    child: Column(children: [
                      const SizedBox(
                        height: AppDimensions.disheTitleSizedBox,
                      ),
                      DisheTitle(name: dishe.name, theme: theme.textTheme),
                      const SizedBox(
                        height: AppDimensions.disheInfoSizedBox,
                      ),
                      DisheInfo(
                          theme: theme.textTheme,
                          rank: dishe.rank,
                          price:
                              dishe.price.toString() + AppStrings.priceSymbol),
                      const SizedBox(
                        height: AppDimensions.disheDescriptionSizedBox,
                      ),
                      SizedBox(
                        width: width,
                        child: DisheDescriptions(
                            theme: theme.textTheme,
                            description: dishe.description),
                      ),
                      const SizedBox(
                        height: AppDimensions.disheNumberSizedBox,
                      ),
                      DisheNumber(
                        theme: theme.textTheme,
                        disheBloc: disheBloc,
                      ),
                      const SizedBox(
                        height: AppDimensions.disheNumberSizedBox,
                      ),
                      DisheTotalPrice(
                          price: dishe.price,
                          width: width,
                          theme: theme.textTheme,
                          disheBloc: disheBloc)
                    ]),
                  ),
                ]),
                const DisheFavorite(),
              ]),
            ),
          ),
          const DisheTopMenu(),
        ],
      ),
    );
  }
}
