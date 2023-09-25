import 'package:app_ui/app_ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notify/app/cubit/app_cubit.dart';
import 'package:notify/presentation/settings/settings.dart';
import 'package:notify/router/app_router.dart';
import 'package:notify/utils/extensions/context_extension.dart';

@immutable
final class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SettingsAppBar(),
      body: Stack(
        children: [
          ListView(
            children: [
              SettingsTile(
                subTiles: [
                  SubSettingTile(
                    title: context.l10n.settingsLanguage,
                    leading: const Icon(
                      FontAwesomeIcons.globe,
                    ),
                    onTap: () async {
                      final locale = await context.pushRoute<Locale>(
                        const LanguageRoute(),
                      );
                      if (context.mounted) {
                        context.read<AppCubit>().changeLocale(locale);
                      }
                    },
                  ),
                  SubSettingTile(
                    title: context.l10n.settingsTheme,
                    leading: Icon(
                      Theme.of(context).brightness == Brightness.dark
                          ? FontAwesomeIcons.solidMoon
                          : FontAwesomeIcons.solidSun,
                    ),
                    onTap: () async {
                      final themeMode = await context.pushRoute<ThemeMode>(
                        const ThemeRoute(),
                      );
                      if (context.mounted) {
                        context.read<AppCubit>().changeTheme(themeMode);
                      }
                    },
                  ),
                ],
              ),
              SettingsTile(
                title: Text(context.l10n.settingsLegal),
                subTiles: [
                  SubSettingTile(
                    title: context.l10n.settingsTermAndCondition,
                    leading: Icon(
                      IconDataSolid(FontAwesomeIcons.bookOpen.codePoint),
                    ),
                    onTap: () => context.read<SettingsBloc>().add(
                          TermAndConditionPressed(
                            title: context.l10n.settingsTermAndCondition,
                          ),
                        ),
                  ),
                  SubSettingTile(
                    title: context.l10n.settingsPrivacyPolicy,
                    leading: Icon(
                      IconDataSolid(FontAwesomeIcons.shieldHalved.codePoint),
                    ),
                    onTap: () => context.read<SettingsBloc>().add(
                          PrivacyPolicyPressed(
                            title: context.l10n.settingsPrivacyPolicy,
                          ),
                        ),
                  ),
                ],
              ),
              SettingsTile(
                subTiles: [
                  SubSettingTile(
                    isShowNavigationArrow: false,
                    title: context.l10n.settingsLogout,
                    leading: const Icon(
                      FontAwesomeIcons.arrowRightFromBracket,
                    ),
                    onTap: () => context.read<SettingsBloc>().add(
                          LogoutButtonPressed(),
                        ),
                  ),
                ],
              ),
            ],
          ),
          BlocBuilder<SettingsBloc, SettingsState>(
            buildWhen: (previous, current) =>
                previous.isLoding != current.isLoding,
            builder: (context, state) =>
                LoadingWidget(isLoading: state.isLoding),
          ),
        ],
      ),
    );
  }
}
