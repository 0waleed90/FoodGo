import 'package:delivery/core/utils/app_router.dart';
import 'package:delivery/core/utils/constants.dart';
import 'package:delivery/core/utils/styles.dart';
import 'package:delivery/feature/home/data/model/food_model/food_model.dart';
import 'package:delivery/feature/home/presentation/manger/food_cubit/food_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.food});
  final FoodModel food;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kCartView);
            },
            icon: Icon(Icons.shopping_cart, color: kPrimaryColor, size: 33),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.33,
                  child: Image.network(food.image, fit: .contain),
                ),
              ),
              SizedBox(height: 12),
              Text(food.name, style: Styles.textStyle24),
              SizedBox(height: 12),

              Row(
                children: [
                  Icon(Icons.star, color: Color(0xffFC9432)),
                  SizedBox(width: 10),
                  Text(
                    '${food.rating} -  ${food.reviewCount}',
                    style: Styles.textStyle16.copyWith(fontWeight: .w500),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                food.instructions.toString(),
                style: Styles.textStyle16.copyWith(fontWeight: .w400),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Container(
                    height: 70,
                    width: 104,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurStyle: .outer,
                          blurRadius: 7,
                          color: Colors.black26,
                        ),
                      ],
                      borderRadius: .circular(20),
                      color: kPrimaryColor,
                    ),
                    child: Center(
                      child: Text(
                       '${food.price} \$',
                        style: Styles.textStyle24.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<FoodCubit>().addToCart(
                          food.id,
                          food.name,
                          food.image,
                          food.rating,
                          food.price,
                          food.reviewCount,
                          food.instructions??[],
                        );
                      },
                      child: Container(
                        height: 70,

                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurStyle: .outer,
                              blurRadius: 7,
                              color: Colors.black26,
                            ),
                          ],
                          borderRadius: .circular(20),
                          color: Color(0xff3C2F2F),
                        ),
                        child: Center(
                          child: Text(
                            'Add to cart',
                            style: Styles.textStyle24.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
