import 'package:delivery/core/utils/constants.dart';
import 'package:delivery/core/utils/styles.dart';
import 'package:delivery/core/utils/widgets/custom_button.dart';
import 'package:delivery/feature/home/presentation/manger/food_cubit/food_cubit.dart';
import 'package:delivery/feature/payment/presentation/view/checkout_view/payment_method_list_view.dart';
import 'package:delivery/feature/payment/presentation/view/checkout_view/price_detils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    num orderPrice =context.read<FoodCubit>().getTotalPriceOfCartItem();
    double total = orderPrice-0.3-1.5;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text('Order summary', style: Styles.textStyle20),
              Divider(height: 10, color: kPrimaryColor,thickness: 2,),
              PriceDetails(leftText: 'Order', rightText: '$orderPrice \$'),
        
              PriceDetails(leftText: 'Taxes', rightText: r'0.3 $'),
              PriceDetails(leftText: 'Delivery fees', rightText: r'1.5 $'),
              Divider(height: 10, color: kPrimaryColor),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                children: [
                  Text('total', style: Styles.textStyle20),
                  Text('$total \$', style: Styles.textStyle20),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                children: [
                  Text('Estimated delivery time:', style: Styles.textStyle14),
                  Text('15 - 30mins', style: Styles.textStyle14),
                ],
              ),
              SizedBox(height: 20),
              Divider(height: 10,color: kPrimaryColor,thickness: 2,),
              SizedBox(height: 20),
              Text('Payment method', style: Styles.textStyle20),
              PaymentMethodListView(),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Total price', style: Styles.textStyle16),
        
                      Text(
                        '$total \$',
                        style: TextStyle(fontSize: 32, fontWeight: .w600),
                      ),
                    ],
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: CustomButton(
                      text: 'Pay Now',
                      color: Color(0xff3B2E2E),
                      textColor: Colors.white,
                      width: double.infinity,
                      onTap: () {},
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
