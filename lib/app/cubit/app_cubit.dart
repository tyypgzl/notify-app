import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:notify/core/localization/localization.dart';

part 'app_state.dart';

final class AppCubit extends HydratedCubit<AppState> {
  AppCubit() : super(const AppState());

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    final languageCode = json['language_code'] as String?;
    final theme = json['theme'] as String?;

    return AppState(
      locale: Locale(languageCode ?? L10n.en.languageCode),
      themeMode: theme == 'dark' ? ThemeMode.dark : ThemeMode.light,
    );
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    return {
      'language_code': state.locale.languageCode,
      'theme': state.themeMode.name,
    };
  }

  void changeLocale(Locale? locale) {
    emit(
      state.copyWith(
        locale: locale ?? L10n.en,
      ),
    );
  }

  void changeTheme() {
    emit(
      state.copyWith(
        themeMode: state.themeMode == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light,
      ),
    );
  }
}
