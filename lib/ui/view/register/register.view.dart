import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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

  RegisterCubit get cubit => context.read<RegisterCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(R.colors.primary),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (_, state) {
            if (state.status == Status.loaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text(
                  'Regiser successfully',
                  style: TextStyle(color: Colors.white),
                )),
              );
            }
          },
          builder: (_, state) {
            if (state.status == Status.loading) {
              return const CircularProgressIndicator();
            }
            if (state.status == Status.error) {
              return const Center(child: Text('Something went wrong'));
            }
            return ListView(
              children: [
                _buildSpace(),
                _buildLogo(),
                _buildHeader(),
                _buildEmail(),
                _buildPassword(),
                _buildButton(),
                _buildLogin()
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
        onPressed: cubit.register,
        style: ButtonStyle(
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              vertical: 16,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            Color(R.colors.secondary),
          ),
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
}
