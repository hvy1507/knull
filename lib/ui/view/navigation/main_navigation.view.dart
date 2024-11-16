import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeleton/resources/resources.dart';
import 'package:skeleton/ui/route/routes.dart';
import 'package:skeleton/ui/widget/image_view.dart';
import 'package:skeleton/utils/extension/build_context.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: CurvedNavigationBar(
        color: context.colorScheme.tertiary,
        height: 75,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeOutQuart,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: context.colorScheme.tertiary,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go(AppRoute.home);
            case 1:
              context.go(AppRoute.dictionary);
            case 2:
              context.go(AppRoute.add);
            case 3:
              context.go(AppRoute.gemini);
            case 4:
              context.go(AppRoute.account);
          }
          setState(() {
            selected = index;
          });
        },
        items: <Widget>[
          BottomIcon(
            index: 0,
            selectedIcon: R.vectors.home_selected,
            unselectedIcon: R.vectors.home,
            selectedIndex: selected,
          ),
          BottomIcon(
            index: 1,
            selectedIcon: R.vectors.dictionary_selected,
            unselectedIcon: R.vectors.dictionary,
            selectedIndex: selected,
          ),
          BottomIcon(
            index: 2,
            selectedIcon: R.vectors.add_filled,
            unselectedIcon: R.vectors.add,
            selectedIndex: selected,
          ),
          BottomIcon(
            index: 3,
            selectedIcon: R.vectors.gemini_ai,
            unselectedIcon: R.vectors.gemini_ai,
            selectedIndex: selected,
          ),
          BottomIcon(
            index: 4,
            selectedIcon: R.vectors.account_selected,
            unselectedIcon: R.vectors.account,
            selectedIndex: selected,
          ),
        ],
      ),
    );
  }
}

class BottomIcon extends StatelessWidget {
  const BottomIcon({
    super.key,
    required this.index,
    required this.unselectedIcon,
    required this.selectedIndex,
    required this.selectedIcon,
  });

  final int index;
  final String selectedIcon;
  final String unselectedIcon;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final isSelected = index == selectedIndex;
    return ImageView.asset(
      isSelected ? selectedIcon : unselectedIcon,
      width: 30,
      height: 30,
      color: context.colorScheme.surface,
    );
  }
}