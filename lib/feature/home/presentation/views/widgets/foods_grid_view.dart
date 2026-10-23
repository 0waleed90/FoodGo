import 'package:delivery/core/utils/widgets/custom_button.dart';
import 'package:delivery/feature/home/presentation/manger/food_cubit/food_cubit.dart';
import 'package:delivery/feature/home/presentation/manger/food_cubit/food_state.dart';
import 'package:delivery/feature/home/presentation/manger/search_cubit/search_cubit.dart';
import 'package:delivery/feature/home/presentation/manger/search_cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import 'foods_grid_view_item.dart';

class FoodsGridView extends StatelessWidget {
  const FoodsGridView({super.key, required this.isSearching});
  final bool isSearching;
  @override
  Widget build(BuildContext context) {
    if (isSearching) {
      return BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchSuccess) {
            if (state.foods.isEmpty) {
              return const Expanded(
                child: Center(
                  child: Text('No food found', style: Styles.textStyle20),
                ),
              );
            }
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
          } else if (state is SearchFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text(
                    state.errorMessage,
                    style: Styles.textStyle20,
                    textAlign: .center,
                  ),

                  const SizedBox(height: 16),
                  CustomButton(
                    text: 'Retry',
                    color: Colors.black,
                    textColor: Colors.white,
                    width: 500,
                    onTap: () {
                      context.read<FoodCubit>().fetchFood();
                    },
                  ),
                ],
              ),
            );
          } else if (state is SearchLoading) {
            return const Expanded(
              child: Center(child: CircularProgressIndicator()),
            );
          } else {
            return const Expanded(
              child: Center(
                child: Text('Type to search food...', style: Styles.textStyle20),
              ),
            );
          }
        },
      );
    } else {
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
            return Center(child: CircularProgressIndicator());
          }
        },
      );
    }
  }
}
