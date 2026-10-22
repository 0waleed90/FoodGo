import 'package:delivery/feature/splash/presentation/view/widget/splash_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: .topLeft,
            end: .bottomRight,
            colors: [Color(0xffFB8A92), kPrimaryColor],
          ),
        ),

        child: SplashViewBody(),
      ),
    );
  }
}
