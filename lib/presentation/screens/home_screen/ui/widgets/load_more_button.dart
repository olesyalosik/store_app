import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core_ui/core_ui.dart';
import 'package:store_app/presentation/blocs/home_bloc/home_bloc.dart';

class LoadMoreButton extends StatelessWidget {
  const LoadMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => BlocProvider.of<HomeBloc>(context).add(LoadMoreEvent()),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              'Load More',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyTextMediumLight,
            ),
          ),
        ),
      ),
    );
  }
}
