import 'package:delivery/feature/home/presentation/manger/food_cubit/food_cubit.dart';
import 'package:delivery/feature/home/presentation/manger/food_cubit/food_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'foods_grid_view_item.dart';

class FoodsGridView extends StatelessWidget {
  const FoodsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (context, state) {
        if (state is FoodSuccess) {
          return Expanded(
            child: GridView.builder(
              itemCount: state.foods.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                childAspectRatio: 0.7,
                crossAxisSpacing: 30,
              ),
              itemBuilder: (context, index) => FoodsGridViewItem(
                imageUrl: state.foods[index].image,
                foods: state.foods[index],
              ),
            ),
          );
        } else if (state is FoodFailure) {
          return Text(state.errorMessage);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
