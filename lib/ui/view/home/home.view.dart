import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:skeleton/ui/theme/theme.cubit.dart';
import 'package:skeleton/ui/view/account/account.view.dart';
import 'package:skeleton/utils/extension/build_context.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selected = 0;

  ThemeCubit get cubit => context.read<ThemeCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: context.colorScheme.onTertiary,
      centerTitle: true,
      title: const Text(
        'Skeleton',
      ),
    );
  }

  Widget _buildBody() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome',
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
