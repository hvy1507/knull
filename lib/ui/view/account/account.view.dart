import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton/constant/languague.dart';
import 'package:skeleton/constant/theme.ext.dart';
import 'package:skeleton/resources/resources.dart';
import 'package:skeleton/ui/theme/theme.cubit.dart';
import 'package:skeleton/ui/theme/theme.state.dart';
import 'package:skeleton/ui/widget/clickable.dart';
import 'package:skeleton/ui/widget/image_view.dart';
import 'package:skeleton/utils/extension/build_context.dart';
import 'package:skeleton/utils/extension/list.ext.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  ThemeCubit get cubit => context.read<ThemeCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Settings',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _buildInfo(),
              _buildSettings(state),
            ].addBetween(const SizedBox(
              height: 24,
            )),
          ),
        ),
      );
    });
  }

  Widget _buildInfo() {
    return Column(
        children: <Widget>[
      ImageView.asset(
        R.images.defaul_avatar,
        width: 64,
        height: 64,
      ),
      Text(
        'Duong Quoc Huy',
        style: context.textTheme.titleMedium,
      ),
      const Text('dqhuy1507@gmail.com')
    ].addBetween(const SizedBox(
      height: 12,
    )));
  }

  Widget _buildSettings(ThemeState state) {
    return Column(
      children: <Widget>[
        SettingRow(
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
              ImageView.asset(
                R.vectors.english,
                width: 16,
                height: 16,
              ),
              ImageView.asset(
                R.vectors.vietnamese,
                width: 16,
                height: 16,
              ),
            ],
          ),
        ),
        SettingRow(
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
              cubit.toggle();
            },
            current: state.themeMode,
            values: Mode.values,
            iconList: [
              ImageView.asset(
                R.vectors.light,
                height: 24,
                width: 24,
              ),
              ImageView.asset(
                R.vectors.dark,
                height: 24,
                width: 24,
              ),
            ],
          ),
        ),
      ].addBetween(const SizedBox(height: 16)),
    );
  }
}

class SettingRow extends StatelessWidget {
  const SettingRow({
    super.key,
    required this.icon,
    required this.name,
    required this.child,
  });

  final String icon;
  final String name;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.onTertiary,
          ),
          child: ImageView.asset(
            icon,
            width: 24,
            height: 24,
          ),
        ),
        Text(name),
        const Spacer(),
        child
      ].addBetween(const SizedBox(width: 8)),
    );
  }
}
