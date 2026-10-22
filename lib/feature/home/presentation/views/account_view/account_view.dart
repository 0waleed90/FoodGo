import 'package:delivery/core/utils/app_router.dart';
import 'package:delivery/core/utils/constants.dart';
import 'package:delivery/core/utils/styles.dart';
import 'package:delivery/core/utils/widgets/custom_button.dart';
import 'package:delivery/core/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          Align(
            alignment: .xy(0, -0.9),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Opacity(
                  opacity: 0.4,
                  child: Image.asset('assets/photos/image 16.png'),
                ),
                Opacity(
                  opacity: 0.4,
                  child: Image.asset('assets/photos/image 15.png'),
                ),
              ],
            ),
          ),
          Align(
            alignment: .bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height*0.75,
              decoration: BoxDecoration(
                borderRadius: .only(
                  topLeft: .circular(32),
                  topRight: .circular(32),
                ),

                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                  right: 14,
                  left: 14,
                  bottom: 20,
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text('Name', style: Styles.textStyle20),
                    CustomTextField(hintText: 'waleed', readOnly: true),
                    SizedBox(height: 15),
                    Text('Email', style: Styles.textStyle20),
                    CustomTextField(
                      hintText: 'nmrghsis@gmail.com',
                      readOnly: true,
                    ),
                    SizedBox(height: 15),
                    Text('Delivery Address', style: Styles.textStyle20),
                    CustomTextField(hintText: 'your name', readOnly: true),
                    SizedBox(height: 20),
                    Divider(height: 10, color: kPrimaryColor),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Payment details',
                          style: TextStyle(fontWeight: .w500, fontSize: 18),
                        ),
                        IconButton(
                          onPressed: () {GoRouter.of(context).push(AppRouter.kCheckoutView);},
                          icon: Icon(Icons.arrow_forward),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Order history',
                          style: TextStyle(fontWeight: .w500, fontSize: 18),
                        ),
                        IconButton(
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.kOrderHistory);


                          },
                          icon: Icon(Icons.arrow_forward),
                        ),
                      ],
                    ),
                    Spacer(),
                    CustomButton(
                      text: 'Edit profile',
                      color: Color(0xff3C2F2F),
                      textColor: Colors.white,
                      width: double.infinity,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: .xy(0, -0.8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: .circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    blurStyle: .outer,
                    color: Colors.black26,
                  ),
                ],

                border: .all(style: .solid, color: kPrimaryColor),
              ),

              child: Image.asset('assets/photos/burger.png', fit: .contain),
            ),
          ),

          Align(
            alignment: .topLeft,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back, size: 28, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
