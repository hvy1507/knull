import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeleton/constant/status.k.dart';
import 'package:skeleton/resources/resources.dart';
import 'package:skeleton/ui/route/routes.dart';
import 'package:skeleton/ui/view/login/login.cubit.dart';
import 'package:skeleton/ui/view/login/login.state.dart';
import 'package:skeleton/ui/widget/app_logo.dart';
import 'package:skeleton/ui/widget/image_view.dart';
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
      backgroundColor: Color(R.colors.primary),
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
                _buildButton(),
                _buildSignUp()
              ].addBetween(const SizedBox(height: 24)),
            );
          },
          listener: (_, state) {
            if (state.status == Status.loaded) {
              context.go(AppRoute.home);
            }
          },
        ),
      ),
    );
  }

  Widget _buildSpace() => const SizedBox(height: 64);

  Widget _buildLogo() => const AppLogo();

  Widget _buildHeader() => const Text(
        'Login to your Account',
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

  Widget _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: cubit.login,
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 16),
          ),
          backgroundColor: WidgetStatePropertyAll(
            Color(R.colors.secondary),
          ),
        ),
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSignUp() {
    return Center(
      child: Text.rich(
        TextSpan(
          text: 'Not a member? ',
          style: const TextStyle(
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: ' Register',
              style: TextStyle(
                color: Color(R.colors.secondary),
                fontWeight: FontWeight.bold,
              ),
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

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    required this.message,
  });

  final String message;

  static Future<void> show(
    BuildContext context, {
    required String message,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return ErrorDialog(
          message: message,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(R.colors.primary),
      icon: ImageView.asset(
        R.vectors.error,
        width: 64,
        height: 64,
      ),
      title: Text(
        message,
        style: const TextStyle(fontSize: 16),
      ),
      actions: [
        FilledButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              Color(R.colors.secondary),
            ),
          ),
          onPressed: context.pop,
          child: const Text(
            'Close',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
