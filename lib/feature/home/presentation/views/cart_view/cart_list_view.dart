import 'package:flutter/cupertino.dart';

import 'cart_list_view_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 340),
        itemCount: 5,
        itemBuilder: (context, index) {
          return CartListViewItem();
        },
      ),
    );
  }
}
