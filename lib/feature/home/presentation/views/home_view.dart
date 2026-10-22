import 'package:delivery/core/utils/app_router.dart';
import 'package:delivery/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/constants.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomButton(
        icon: Icons.shopping_cart,
        text: '',
        color: Color(0xffFB8A92),
        textColor: Colors.white,
        width: 50,
        onTap: () {GoRouter.of(context).push(AppRouter.kCartView);},
      ),
      body: const HomeViewBody(),
    );
  }
}
