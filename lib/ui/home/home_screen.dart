import 'package:ecommerce/ui/home/home_viewmode_navigatorl_mvvm_centered.dart';
import 'package:flutter/material.dart';

import '../../base/base_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen, HomeViewModelMVVMCentered>
    implements HomeNavigatorMVVMCentered {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  @override
  HomeViewModelMVVMCentered initViewModel() => HomeViewModelMVVMCentered();
}
