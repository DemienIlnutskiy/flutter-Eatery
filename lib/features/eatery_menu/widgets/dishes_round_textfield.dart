import 'package:eatery/core/constants/constants.dart';
import 'package:eatery/features/eatery_menu/bloc/eatery_menu_bloc.dart';
import 'package:flutter/material.dart';

class DishesRoundTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? left;
  final EateryMenuBloc eateryMenuBloc;

  const DishesRoundTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    this.left,
    required this.eateryMenuBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.lightGray, borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          if (left != null)
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: left!,
            ),
          Expanded(
            child: TextField(
              key: const Key('textField'),
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                    color: AppColors.gray,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              onChanged: (text) {
                eateryMenuBloc.add(SearchDishesList(search: text));
              },
            ),
          ),
        ],
      ),
    );
  }
}
