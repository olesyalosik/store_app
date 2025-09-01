import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/di/app_di.dart';
import 'package:store_app/domain/enums/category.dart';
import 'package:store_app/domain/enums/sort_pair.dart';
import 'package:store_app/navigation/app_router.dart';
import 'package:store_app/presentation/blocs/home_bloc/home_bloc.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.topRight,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sort By',
                  style: Theme.of(context).primaryTextTheme.bodyMedium,
                ),
                DropdownMenu<SortPair>(
                  dropdownMenuEntries: SortPair.values
                      .map(
                        (e) => DropdownMenuEntry(value: e, label: e.toString()),
                      )
                      .toList(),
                  initialSelection: BlocProvider.of<HomeBloc>(
                    context,
                  ).appliedFilter.sortBy,
                  onSelected: (e) => BlocProvider.of<HomeBloc>(
                    context,
                  ).add(ApplyFilterEvent(sortBy: e, category: null)),
                ),
                SizedBox(height: 10),
                Text(
                  'Filter By',
                  style: Theme.of(context).primaryTextTheme.bodyMedium,
                ),
                DropdownMenu<CategoryEnum>(
                  dropdownMenuEntries: CategoryEnum.values
                      .map((e) => DropdownMenuEntry(value: e, label: e.name))
                      .toList(),
                  initialSelection: BlocProvider.of<HomeBloc>(
                    context,
                  ).appliedFilter.category,
                  onSelected: (e) => BlocProvider.of<HomeBloc>(
                    context,
                  ).add(ApplyFilterEvent(sortBy: null, category: e)),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(
                      context,
                    ).add(ApplyFilterEvent(sortBy: null, category: null));
                    appLocator.get<AppRouter>().pop();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(10.0),
                      child: Text(
                        'Remove filters',
                        style: Theme.of(context).primaryTextTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
