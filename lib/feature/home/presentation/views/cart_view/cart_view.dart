import 'package:delivery/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'cart_bottom_sheet.dart';
import 'cart_list_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomSheet: CartBottomSheet(),
      appBar: AppBar(title: Text('My Cart', style: Styles.textStyle36)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: const Column(children: [CartListView()]),
      ),
    );
  }
}
