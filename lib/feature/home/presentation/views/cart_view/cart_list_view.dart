import 'package:delivery/feature/home/presentation/manger/food_cubit/food_cubit.dart';
import 'package:delivery/feature/home/presentation/manger/food_cubit/food_state.dart';
import 'package:delivery/feature/home/presentation/views/cart_view/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import 'cart_list_view_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (context, state) {
        if (state is FoodSuccess) {
          if (state.cartItems.isEmpty) {
            return EmptyCart();
          }
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 340),
              itemCount: state.cartItems.length,
              itemBuilder: (context, index) {
                return CartListViewItem(
                  food: state.cartItems[index],
                  index: index,
                );
              },
            ),
          );
        } else if (state is FoodLoading) {
          return CircularProgressIndicator();
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
                    context.read<FoodCubit>().fetchFood();
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
