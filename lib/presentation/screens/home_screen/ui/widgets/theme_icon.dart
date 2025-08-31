import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/presentation/blocs/theme_bloc/theme_bloc.dart';

class ThemeIcon extends StatelessWidget {
  const ThemeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<ThemeBloc>(context).add(ChangeThemeEvent()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) =>
            state.isDark ? Icon(Icons.dark_mode) : Icon(Icons.light_mode),
      ),
    );
  }
}
