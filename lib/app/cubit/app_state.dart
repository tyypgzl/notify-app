part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({
    this.themeMode = ThemeMode.light,
    this.locale = L10n.en,
  });

  final Locale locale;
  final ThemeMode themeMode;

  bool get isDark => themeMode == ThemeMode.dark;

  @override
  List<Object?> get props => [locale, themeMode];

  AppState copyWith({
    Locale? locale,
    ThemeMode? themeMode,
  }) {
    return AppState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
