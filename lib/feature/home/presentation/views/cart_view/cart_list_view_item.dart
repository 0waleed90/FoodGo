import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'count_control_widget.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: .circular(20),
          boxShadow: [BoxShadow(blurRadius: 10, blurStyle: .outer)],
        ),
        child: Row(
          children: [
            Image.asset('assets/photos/burger.png'),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'ChessBurger  ',
                    style: Styles.textStyle20,
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Wendy Burger',
                    style: Styles.textStyle16.copyWith(fontWeight: .normal),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  SizedBox(height: 10),
                  Text('19.9', style: Styles.textStyle16),
                  SizedBox(height: 10),
                  CountControlWidget(index: 0, cartItemCount: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
