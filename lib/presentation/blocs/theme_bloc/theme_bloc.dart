import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(isDark: false)) {
    on<ChangeThemeEvent>((event, emit) {
      emit(ThemeState(isDark: !state.isDark));
    });
  }
}
