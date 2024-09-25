import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Skeleton',
          )
      ),
      body: const Center(
        child: Text(
          'Account',
        ),
      ),
    );
  }
}
