import 'package:delivery/feature/home/presentation/views/order_history_view/orders_list_view.dart';
import 'package:flutter/material.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: Padding(

          padding: EdgeInsets.symmetric(horizontal: 14),
          child: const OrdersListView()),
    );
  }
}
