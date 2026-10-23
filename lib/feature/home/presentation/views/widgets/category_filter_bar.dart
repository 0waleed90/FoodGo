import 'package:delivery/core/utils/constants.dart';
import 'package:delivery/core/utils/styles.dart';
import 'package:delivery/feature/home/presentation/manger/food_cubit/food_cubit.dart';
import 'package:delivery/feature/home/presentation/manger/food_cubit/food_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/custom_button.dart';

class CategoryFilterBar extends StatefulWidget {
  const CategoryFilterBar({super.key});

  @override
  State<CategoryFilterBar> createState() => _CategoryFilterBarState();
}

class _CategoryFilterBarState extends State<CategoryFilterBar> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (context, state) {
        if (state is FoodSuccess) {
          return SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length + 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    index==0?context.read<FoodCubit>().fetchFood()
                    :context.read<FoodCubit>().getFoodByCategory(
                      state.categories[index],
                    );
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            blurStyle: .outer,
                          ),
                        ],
                        borderRadius: .circular(20),
                        color: selectedCategory == index ? kPrimaryColor : null,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            index == 0 ? 'All' : state.categories[index - 1],
                            style: Styles.textStyle16,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FoodFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                const Icon(Icons.wifi_off, size: 64, color: Colors.grey),
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
                    context.read<FoodCubit>().getAllCategory();
                  },
                ),
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
