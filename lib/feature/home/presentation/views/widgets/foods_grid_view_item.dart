import 'package:delivery/core/utils/app_router.dart';
import 'package:delivery/core/utils/styles.dart';
import 'package:delivery/feature/home/data/model/food_model/food_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FoodsGridViewItem extends StatelessWidget {
  const FoodsGridViewItem({
    super.key,
    required this.imageUrl,
    required this.foods,
  });
  final String imageUrl;
  final FoodModel foods;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDetailsView,extra:foods);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: .circular(20),
          boxShadow: [
            BoxShadow(blurStyle: .outer, blurRadius: 7, color: Colors.black26),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: .center,
            children: [
              Expanded(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
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
              SizedBox(height: 15),
              Text(
                foods.name,
                style: Styles.textStyle20,
                maxLines: 1,
                overflow: .ellipsis,
              ),
              Text(
                (foods.instructions?[0]) ?? '',
                style: Styles.textStyle16.copyWith(fontWeight: .normal),
                maxLines: 1,
                overflow: .ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xffFC9432)),
                      SizedBox(width: 4),
                      Text('4.9', style: Styles.textStyle16),
                    ],
                  ),

                  Icon(Icons.favorite_border, size: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
