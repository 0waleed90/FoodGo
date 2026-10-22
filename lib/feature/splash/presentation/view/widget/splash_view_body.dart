import 'package:delivery/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      GoRouter.of(context).go(AppRouter.kHomeView);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final screenWidth = screenSize.width;
    return Stack(
      children: [
        Align(
          alignment: .center,
          child: Text(
            'Foodgo',
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.2,
              fontFamily: 'Lobster',
            ),
          ),
        ),
        Align(
          alignment: .bottomLeft,

          child: Image.asset(
            'assets/photos/big_burger.png',
            width: screenWidth * 0.5,
          ),
        ),
        Align(
          alignment: const .xy(0.3, 1),
          child: Image.asset(
            'assets/photos/burger.png',
            width: screenWidth * 0.5,
          ),
        ),
      ],
    );
  }
}
