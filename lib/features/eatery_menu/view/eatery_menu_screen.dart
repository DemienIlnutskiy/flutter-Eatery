import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:eatery/core/constants/constants.dart';
import 'package:eatery/core/errors/loading_failure.dart';
import 'package:eatery/core/repositories/eatery_menu/menu_repository.dart';
import 'package:eatery/features/eatery_menu/bloc/eatery_menu_bloc.dart';
import 'package:eatery/features/eatery_menu/widgets/widgets.dart';
import 'package:eatery/core/copmonents/copmonents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class EateryMenuScreen extends StatefulWidget {
  const EateryMenuScreen({super.key});

  @override
  State<EateryMenuScreen> createState() => _EateryMenuScreenState();
}

class _EateryMenuScreenState extends State<EateryMenuScreen> {
  final TextEditingController txtSearch = TextEditingController();
  final _eateryMenuBloc = EateryMenuBloc(GetIt.I<MenuRepository>());
  @override
  void initState() {
    _eateryMenuBloc.add(LoadDishesList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Scaffold(
      drawer: const SubNavigationBar(),
      appBar: AppBar(
        title: const Text(AppStrings.menuTitle),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Completer completer = Completer();
          _eateryMenuBloc.add(LoadDishesList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<EateryMenuBloc, EateryMenuState>(
          bloc: _eateryMenuBloc,
          builder: (context, state) {
            if (state is DishesListLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      DishesSearchField(
                        eateryMenuBloc: _eateryMenuBloc,
                        txtSearch: txtSearch,
                      ),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(
                            top: AppDimensions.eateryMenuPadding),
                        itemCount: state.dishesList.length,
                        itemBuilder: (context, i) {
                          final dishesList = state.dishesList[i];
                          return DishesList(
                            dishe: dishesList,
                            width: width,
                            height:
                                width / AppDimensions.eateryMenuHeightDivider,
                          );
                        },
                        separatorBuilder: (context, i) => const Divider(),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is DishesListLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(LoadingFailure.title,
                        style: theme.textTheme.headlineMedium),
                    Text(
                      LoadingFailure.subTitle,
                      style: theme.textTheme.labelMedium,
                    ),
                    const SizedBox(
                      height: AppDimensions.eateryMenuFailureSpace,
                    ),
                    TextButton(
                        onPressed: () {
                          _eateryMenuBloc.add(LoadDishesList());
                        },
                        child: const Text(LoadingFailure.buttonText))
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      bottomNavigationBar: const MainNavigationBar(),
    );
  }
}
