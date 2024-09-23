import 'package:flutter/material.dart';
import 'package:skeleton/resources/resources.dart';
import 'package:skeleton/ui/widget/app_logo.dart';
import 'package:skeleton/utils/extension/list.ext.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(R.colors.primary),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSpace(),
            _buildLogo(),
            _buildHeader(),
            _buildPhone(),
            _buildPassword(),
            _buildButton()
          ].addBetween(const SizedBox(
            height: 16,
          )),
        ),
      ),
    );
  }

  Widget _buildSpace() => const SizedBox(
        height: 128,
      );

  Widget _buildLogo() => const AppLogo();

  Widget _buildHeader() => const Text(
        'Login to your Account',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      );

  Widget _buildPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Phone number',
          style: TextStyle(color: Colors.white),
        ),
        const TextField(),
      ].addBetween(const SizedBox(
        height: 8,
      )),
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
      ].addBetween(
        const SizedBox(
          height: 8,
        ),
      ),
    );
  }
  Widget _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Color(R.colors.primary),
          ),
        ),
        child: const Text('Login'),
      ),
    );
  }
}
