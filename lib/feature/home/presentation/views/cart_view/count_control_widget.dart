import 'package:delivery/core/utils/constants.dart';
import 'package:delivery/feature/home/presentation/manger/food_cubit/food_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../manger/food_cubit/food_state.dart';

class CountControlWidget extends StatelessWidget {
  const CountControlWidget({
    super.key,
    required this.index,
    required this.cartItemCount, required this.id,
  });
  final int index;
  final int cartItemCount;
final int id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            operator('-', () {
              context.read<FoodCubit>().decreaseCartItemCount(index);
            }),
            const SizedBox(width: 10),
            Text(
              cartItemCount.toString(),
              style: Styles.textStyle14.copyWith(color: kPrimaryColor),
            ),
            const SizedBox(width: 10),
            operator('+', () {
              context.read<FoodCubit>().increaseCartItemCount(index);
            }),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {context.read<FoodCubit>().removeFromCart(id);},
              icon: Icon(Icons.delete, color: Colors.red, size: 28),
            ),
          ],
        );
      },
    );
  }

  GestureDetector operator(String opr, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 23,
        width: 23,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(opr, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
