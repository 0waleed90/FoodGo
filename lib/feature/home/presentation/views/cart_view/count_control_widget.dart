import 'package:delivery/core/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CountControlWidget extends StatelessWidget {
  const CountControlWidget({
    super.key,
    required this.index,
    required this.cartItemCount,
  });
  final int index;
  final int cartItemCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        operator('-', () {}),
        const SizedBox(width: 10),
        Text(
          cartItemCount.toString(),
          style: Styles.textStyle14.copyWith(color: kPrimaryColor),
        ),
        const SizedBox(width: 10),
        operator('+', () {}),
        const SizedBox(width: 10),
      ],
    );
  }

  GestureDetector operator(String opr, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 23,
        width: 23,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(opr, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
