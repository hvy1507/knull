import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton/constant/languague.dart';
import 'package:skeleton/constant/theme.ext.dart';
import 'package:skeleton/resources/resources.dart';
import 'package:skeleton/ui/theme/theme.cubit.dart';
import 'package:skeleton/ui/theme/theme.state.dart';
import 'package:skeleton/ui/widget/image_view.dart';
import 'package:skeleton/utils/extension/build_context.dart';
import 'package:skeleton/utils/extension/list.ext.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const AccountAppBar(),
          body: Column(
            children: <Widget>[
              const UserInfoSection(),
              SettingsSection(state: state),
            ].addBetween(
              const SizedBox(height: 24),
            ),
          ),
        );
      },
    );
  }
}

class AccountAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AccountAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Settings'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ImageView.asset(R.images.defaul_avatar, width: 64, height: 64),
        Text('Duong Quoc Huy', style: context.textTheme.titleLarge),
        Text('dqhuy1507@gmail.com', style: context.textTheme.titleMedium),
        const EditProfileButton(),
      ].addBetween(const SizedBox(height: 16)),
    );
  }
}

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      onPressed: () {},
      child: Text(
        'Edit profile',
        style: context.textTheme.titleMedium?.copyWith(
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final ThemeState state;

  const SettingsSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LanguageSettingRow(state: state),
        ThemeSettingRow(state: state),
        const FAQSettingRow(),
        const LogoutSettingRow(),
      ].addBetween(const SizedBox(height: 16)),
    );
  }
}

class LanguageSettingRow extends StatelessWidget {
  final ThemeState state;

  const LanguageSettingRow({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SettingRow(
      icon: R.vectors.language,
      name: R.strings.language.tr(),
      child: AnimatedToggleSwitch<AppLang>.size(
        style: ToggleStyle(
          backgroundColor: context.colorScheme.onTertiary,
          borderColor: context.colorScheme.onPrimary,
        ),
        height: 36,
        current: AppLang.fromLocale(context.locale),
        values: AppLang.values,
        onChanged: (lang) {
          context.setLocale(lang.locale);
        },
        iconList: [
          ImageView.asset(R.vectors.english, width: 16, height: 16),
          ImageView.asset(R.vectors.vietnamese, width: 16, height: 16),
        ],
      ),
    );
  }
}

class ThemeSettingRow extends StatelessWidget {
  final ThemeState state;

  const ThemeSettingRow({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SettingRow(
      icon: R.vectors.theme,
      name: state.themeMode == Mode.light
          ? R.strings.dark_mode.tr()
          : R.strings.light_mode.tr(),
      child: AnimatedToggleSwitch<Mode>.rolling(
        style: ToggleStyle(
          backgroundColor: context.colorScheme.onTertiary,
          borderColor: context.colorScheme.onPrimary,
        ),
        styleAnimationType: AnimationType.onSelected,
        height: 36,
        onChanged: (mode) {
          context.read<ThemeCubit>().toggle();
        },
        current: state.themeMode,
        values: Mode.values,
        iconList: [
          ImageView.asset(R.vectors.light, height: 24, width: 24),
          ImageView.asset(R.vectors.dark, height: 24, width: 24),
        ],
      ),
    );
  }
}

class FAQSettingRow extends StatelessWidget {
  const FAQSettingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingRow(
      icon: R.vectors.faq,
      name: 'FAQ',
      child: const SizedBox(height: 30),
    );
  }
}

class LogoutSettingRow extends StatelessWidget {
  const LogoutSettingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingRow(
      icon: R.vectors.logout,
      name: 'Log out',
      child: const SizedBox(height: 30),
    );
  }
}

class SettingRow extends StatelessWidget {
  final String icon;
  final String name;
  final Widget child;

  const SettingRow({
    super.key,
    required this.icon,
    required this.name,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          ImageView.asset(
            icon,
            width: 24,
            height: 24,
            color: context.colorScheme.tertiary,
          ),
          Text(name),
          const Spacer(),
          child,
        ].addBetween(const SizedBox(width: 16)),
      ),
    );
  }
}
