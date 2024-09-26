import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton/constant/theme.ext.dart';
import 'package:skeleton/resources/resources.dart';
import 'package:skeleton/ui/theme/theme.cubit.dart';
import 'package:skeleton/ui/theme/theme.state.dart';
import 'package:skeleton/ui/widget/clickable.dart';
import 'package:skeleton/ui/widget/image_view.dart';

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
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (_, state) => Scaffold(
        appBar: _buildAppBar(state),
        body: _buildBody(),
      ),
    );
  }

  AppBar _buildAppBar(ThemeState state) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'Skeleton',
      ),
      actions: [
        Container(
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.only(right: 30),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Clickable(
            onTap: cubit.toggle,
            child: state.themeMode == Mode.light
                ? ImageView.asset(
                    R.vectors.dark,
                    width: 30,
                    height: 30,
                  )
                : ImageView.asset(
                    R.vectors.light,
                    width: 30,
                    height: 30,
                  ),
          ),
        ),
      ],
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
