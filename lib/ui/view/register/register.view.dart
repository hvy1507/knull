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
      backgroundColor: Color(R.colors.primary),
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
                _buildEmail(),
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

  Widget _buildHeader() => const Text(
        'Create a new account',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      );

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(color: Colors.white),
        ),
        TextField(
          controller: cubit.email,
        ),
      ].addBetween(const SizedBox(height: 12)),
    );
  }

  Widget _buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(color: Colors.white),
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
        const Text(
          'Confirmed Password',
          style: TextStyle(color: Colors.white),
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
        onPressed: state.matchPassword ? cubit.register : null,
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              vertical: 16,
            ),
          ),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.grey;
            }
            return Color(R.colors.secondary);
          }),
        ),
        child: const Text(
          'Register',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildLogin() {
    return Center(
      child: Text.rich(
        TextSpan(
          text: 'Already have an account? ',
          style: const TextStyle(
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: ' Login',
              style: TextStyle(
                color: Color(R.colors.secondary),
                fontWeight: FontWeight.bold,
              ),
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
            style: const TextStyle(color: Colors.white),
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
        buildValidationString('Length >= 8',
            valid: cubit
                .validPassword(cubit.password.text)
                .contains(PasswordValidation.length)),
        buildValidationString('Contain character ',
            valid: cubit
                .validPassword(cubit.password.text)
                .contains(PasswordValidation.character)),
        buildValidationString('Contain special character ',
            valid: cubit
                .validPassword(cubit.password.text)
                .contains(PasswordValidation.specialCharacter)),
      ].addBetween(const SizedBox(height: 16)),
    );
  }
}
