import 'package:delivery/feature/payment/presentation/view/checkout_view/payment_method_list_view_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({super.key});

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  int selectedCard = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          return PaymentMethodListViewItem(
            selectedCard: selectedCard == index,
            index: index,
            onTap: () {
              setState(() {
                selectedCard = index;
              });
            },
          );
        },
      ),
    );
  }
}
