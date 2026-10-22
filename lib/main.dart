import 'package:delivery/core/utils/api_service.dart';
import 'package:delivery/core/utils/app_router.dart';
import 'package:delivery/feature/home/data/repo/food_repo_impl.dart';
import 'package:delivery/feature/home/presentation/manger/category_cubit/category_cubit.dart';
import 'package:delivery/feature/home/presentation/manger/food_cubit/food_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FoodCubit(foodRepo: FoodRepoImpl(apiService: ApiService(Dio())))..fetchFood(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(
            foodRepo: FoodRepoImpl(apiService: ApiService(Dio()))..fetchAllCategory(),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,

        routerConfig: AppRouter.router,
      ),
    );
  }
}
