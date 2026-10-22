import 'package:delivery/feature/home/presentation/views/order_history_view/orders_list_view_item.dart';
import 'package:flutter/cupertino.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return OrdersListViewItem();
      },
    );
  }
}
