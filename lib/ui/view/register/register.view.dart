import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeleton/constant/password_validation.dart';
import 'package:skeleton/constant/status.k.dart';
import 'package:skeleton/resources/resources.dart';
import 'package:skeleton/ui/route/routes.dart';
import 'package:skeleton/ui/view/register/register.cubit.dart';
import 'package:skeleton/ui/view/register/register.state.dart';
import 'package:skeleton/ui/widget/app_logo.dart';
import 'package:skeleton/utils/extension/build_context.dart';
import 'package:skeleton/utils/extension/list.ext.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _isVisible = false;
  bool _isVisible2 = false;

  RegisterCubit get cubit => context.read<RegisterCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (_, state) {
            if (state.status == Status.loading) {
              return const CircularProgressIndicator();
            }
            return ListView(
              children: [
                _buildSpace(),
                _buildLogo(),
                _buildHeader(),
                _buildEmail(state),
                _buildPassword(),
                if (state.isValid) _buildConfirmedPassword(),
                if (!state.isValid) _buildValidationPassword(),
                _buildButton(state),
                _buildLogin(),
              ].addBetween(const SizedBox(height: 24)),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSpace() => const SizedBox(height: 64);

  Widget _buildLogo() => const AppLogo();

  Widget _buildHeader() => Text(
        R.strings.create_account.tr(),
        style: context.textTheme.titleLarge,
      );

  Widget _buildEmail(RegisterState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          R.strings.email.tr(),
          style: context.textTheme.titleMedium,
        ),
        TextField(
          controller: cubit.email,
          decoration: InputDecoration(
            errorText: state.email.isNotEmpty && !state.validEmail
                ? R.strings.invalid_email.tr()
                : null,
          ),
        ),
      ].addBetween(const SizedBox(height: 12)),
    );
  }

  Widget _buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          R.strings.password.tr(),
          style: context.textTheme.titleMedium,
        ),
        TextField(
          controller: cubit.password,
          obscureText: !_isVisible,
          onChanged: cubit.check,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              child: _isVisible
                  ? const Icon(
                      Icons.visibility,
                      color: Colors.white,
                    )
                  : const Icon(Icons.visibility_off, color: Colors.white),
            ),
          ),
        ),
      ].addBetween(const SizedBox(height: 12)),
    );
  }

  Widget _buildConfirmedPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          R.strings.confirmed_password.tr(),
        ),
        TextField(
          controller: cubit.confirmPassword,
          obscureText: !_isVisible2,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  _isVisible2 = !_isVisible2;
                });
              },
              child: _isVisible2
                  ? const Icon(
                      Icons.visibility,
                      color: Colors.white,
                    )
                  : const Icon(Icons.visibility_off, color: Colors.white),
            ),
          ),
        ),
      ].addBetween(const SizedBox(height: 12)),
    );
  }

  Widget _buildButton(RegisterState state) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: state.canRegister ? cubit.register : null,
        style: const ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              vertical: 16,
            ),
          ),
        ),
        child: Text(
          R.strings.register.tr(),
          style: context.textTheme.titleLarge?.copyWith(
              color: state.canRegister
                  ? context.colorScheme.primary
                  : context.colorScheme.onPrimary),
        ),
      ),
    );
  }

  Widget _buildLogin() {
    return Center(
      child: Text.rich(
        TextSpan(
          text: R.strings.already_have_an_account.tr(),
          children: [
            TextSpan(
              text: R.strings.login.tr(),
              style: context.textTheme.titleMedium
                  ?.copyWith(color: context.colorScheme.tertiary),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.push(AppRoute.login);
                },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildValidationPassword() {
    Widget buildValidationString(String name, {required bool valid}) {
      return Row(
        children: <Widget>[
          Text(
            name,
            style: context.textTheme.titleMedium,
          ),
          valid
              ? const Icon(
                  Icons.check,
                  color: Colors.green,
                )
              : const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
        ].addBetween(const SizedBox(width: 8)),
      );
    }

    return Column(
      children: [
        buildValidationString(R.strings.length.tr(),
            valid: cubit
                .validPassword(cubit.password.text)
                .contains(PasswordValidation.length)),
        buildValidationString(R.strings.character.tr(),
            valid: cubit
                .validPassword(cubit.password.text)
                .contains(PasswordValidation.character)),
        buildValidationString(R.strings.special_character.tr(),
            valid: cubit
                .validPassword(cubit.password.text)
                .contains(PasswordValidation.specialCharacter)),
      ].addBetween(const SizedBox(height: 16)),
    );
  }
}
