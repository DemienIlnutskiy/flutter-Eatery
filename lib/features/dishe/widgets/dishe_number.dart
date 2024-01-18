import 'package:eatery/core/constants/constants.dart';
import 'package:eatery/features/dishe/bloc/dishe_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisheNumber extends StatefulWidget {
  const DisheNumber({
    Key? key,
    required this.theme,
    required this.disheBloc,
  }) : super(key: key);
  final TextTheme theme;
  final DisheBloc disheBloc;
  @override
  State<DisheNumber> createState() => _DisheNumberState();
}

class _DisheNumberState extends State<DisheNumber> {
  @override
  Widget build(BuildContext context) {
    final disheBloc = widget.disheBloc;
    final TextTheme theme = widget.theme;
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.disheEdgeInsetsSymmetric),
      child: Row(
        children: [
          Text(AppStrings.disheNumber, style: widget.theme.labelMedium),
          const Spacer(),
          InkWell(
            onTap: () {
              disheBloc.add(DisheNumberDecrement());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.disheContainerEdgeInsetsSymmetric),
              height: AppDimensions.disheNumberContainerHeight,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(
                      AppDimensions.disheNumberBorderRadius)),
              child: Text(
                AppStrings.disheNumberMinus,
                style: theme.displayMedium,
              ),
            ),
          ),
          const SizedBox(
            width: AppDimensions.disheInsertNumberSizedBox,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.disheContainerEdgeInsetsSymmetric),
            height: AppDimensions.disheNumberContainerHeight,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.black,
                ),
                borderRadius: BorderRadius.circular(
                    AppDimensions.disheNumberBorderRadius)),
            child: BlocBuilder<DisheBloc, int>(
              bloc: disheBloc,
              builder: (context, state) {
                return Text(
                  state.toString(),
                  style: theme.labelMedium,
                );
              },
            ),
          ),
          const SizedBox(
            width: AppDimensions.disheInsertNumberSizedBox,
          ),
          InkWell(
            key: const Key('increment'),
            onTap: () {
              disheBloc.add(DisheNumberIncrement());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.disheContainerEdgeInsetsSymmetric),
              height: AppDimensions.disheNumberContainerHeight,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(
                      AppDimensions.disheNumberBorderRadius)),
              child: Text(
                AppStrings.disheNumberPlus,
                style: theme.displayMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
