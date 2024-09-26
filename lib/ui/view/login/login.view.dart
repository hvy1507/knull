import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeleton/constant/status.k.dart';
import 'package:skeleton/ui/route/routes.dart';
import 'package:skeleton/ui/view/login/login.cubit.dart';
import 'package:skeleton/ui/view/login/login.state.dart';
import 'package:skeleton/ui/widget/app_logo.dart';
import 'package:skeleton/utils/extension/build_context.dart';
import 'package:skeleton/utils/extension/list.ext.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isVisible = false;

  LoginCubit get cubit => context.read<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocConsumer<LoginCubit, LoginState>(
          builder: (_, state) {
            return ListView(
              children: [
                _buildSpace(),
                _buildLogo(),
                _buildHeader(),
                _buildEmail(),
                _buildPassword(),
                _buildButton(state),
                _buildSignUp()
              ].addBetween(const SizedBox(height: 24)),
            );
          },
          listener: (_, state) {
            if (state.status == Status.loaded) {
              // Application().sharedPreferences.setBool(
              //       'hasLoggedIn',
              //       true,
              //     );
              context.go(AppRoute.home);
            }
          },
        ),
      ),
    );
  }

  Widget _buildSpace() => const SizedBox(height: 64);

  Widget _buildLogo() => const AppLogo();

  Widget _buildHeader() => Text(
        'Login to your Account',
        style: context.textTheme.titleLarge,
      );

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: context.textTheme.titleMedium,
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
        Text(
          'Password',
          style: context.textTheme.titleMedium,
        ),
        TextField(
          controller: cubit.password,
          obscureText: _isVisible,
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

  Widget _buildButton(LoginState state) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: state.canLogin ? cubit.login : null,
        child: Text(
          'Login',
          style: context.textTheme.titleLarge?.copyWith(
              color: state.canLogin
                  ? context.colorScheme.primary
                  : context.colorScheme.onPrimary),
        ),
      ),
    );
  }

  Widget _buildSignUp() {
    return Center(
      child: Text.rich(
        TextSpan(
          text: 'Not a member? ',
          children: [
            TextSpan(
              text: ' Register',
              style: context.textTheme.titleMedium
                  ?.copyWith(color: context.colorScheme.tertiary),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.push(AppRoute.register);
                },
            )
          ],
        ),
      ),
    );
  }
}
