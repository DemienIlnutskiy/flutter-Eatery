import 'package:eatery/core/constants/constants.dart';
import 'package:eatery/features/eatery_menu/bloc/eatery_menu_bloc.dart';
import 'package:eatery/features/eatery_menu/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DishesSearchField extends StatelessWidget {
  final TextEditingController txtSearch;

  const DishesSearchField(
      {Key? key, required this.eateryMenuBloc, required this.txtSearch})
      : super(key: key);
  final EateryMenuBloc eateryMenuBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DishesRoundTextfield(
        hintText: "Search Food",
        controller: txtSearch,
        left: Container(
          alignment: Alignment.center,
          width: 30,
          child: const Icon(
            Icons.search,
            size: AppDimensions.disheTopMenuIconHeight,
            color: AppColors.blackGray,
          ),
        ),
        eateryMenuBloc: eateryMenuBloc,
      ),
    );
  }
}
