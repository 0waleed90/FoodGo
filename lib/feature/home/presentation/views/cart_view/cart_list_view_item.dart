import 'package:delivery/core/utils/app_router.dart';
import 'package:delivery/feature/home/data/model/food_model/food_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';
import 'count_control_widget.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem({super.key, required this.food, required this.index});
  final FoodModel food;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDetailsView, extra: food);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: .circular(20),
            boxShadow: [BoxShadow(blurRadius: 10, blurStyle: .outer)],
          ),
          child: Row(
            children: [
              Expanded(
                child: Image.network(
                  food.image,

                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.broken_image_outlined,
                        size: 40,
                        color: Colors.grey,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      food.name,
                      style: Styles.textStyle20,
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                    SizedBox(height: 10),
                    Text(
                      food.instructions?[0] ?? '',
                      style: Styles.textStyle16.copyWith(fontWeight: .normal),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                    SizedBox(height: 10),
                    Text('${food.price} \$', style: Styles.textStyle16),
                    SizedBox(height: 10),
                    CountControlWidget(
                      index: index,
                      cartItemCount: food.quantity, id: food.id,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
