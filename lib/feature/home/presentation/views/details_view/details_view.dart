import 'package:delivery/core/utils/app_router.dart';
import 'package:delivery/core/utils/constants.dart';
import 'package:delivery/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

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
                  child: Image.asset('assets/photos/burger.png', fit: .contain),
                ),
              ),
              SizedBox(height: 12),
              Text('Hamburger Veggie Burger', style: Styles.textStyle24),
              SizedBox(height: 12),

              Row(
                children: [
                  Icon(Icons.star, color: Color(0xffFC9432)),
                  SizedBox(width: 10),
                  Text(
                    '4.8 -  14 mins',
                    style: Styles.textStyle16.copyWith(fontWeight: .w500),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                'Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun. ',
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
                        r'$ 99.99',
                        style: Styles.textStyle24.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
