import 'package:delivery/core/utils/app_router.dart';
import 'package:delivery/core/utils/constants.dart';
import 'package:delivery/core/utils/styles.dart';
import 'package:delivery/core/utils/widgets/custom_button.dart';
import 'package:delivery/core/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          color: Color(0xff121223),
          boxShadow: [
            BoxShadow(blurStyle: .outer, blurRadius: 10, color: Colors.black26),
          ],
          borderRadius: .only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'Delivery Address',
                style: Styles.textStyle20.copyWith(color: kPrimaryColor),
              ),
              SizedBox(height: 20),
              CustomTextField(
                hintText: 'sdgfsg sdfsdg sd ',
                readOnly: true,
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kNewAddressView);
                },
              ),
              SizedBox(height: 20),
              Divider(height: 20, color: kPrimaryColor, thickness: 4),
              SizedBox(height: 10),
              Center(
                child: Text(
                  r'total : 99$',
                  style: TextStyle(color: kPrimaryColor, fontSize: 22),
                ),
              ),
              SizedBox(height: 10),
              Divider(height: 20, color: kPrimaryColor, thickness: 4),
              Expanded(child: SizedBox()),
              CustomButton(
                text: 'Go to checkout',
                color: kPrimaryColor,
                textColor: Colors.white,
                width: double.infinity,
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kCheckoutView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
