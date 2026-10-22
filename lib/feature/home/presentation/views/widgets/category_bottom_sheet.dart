import 'package:delivery/core/utils/constants.dart';
import 'package:delivery/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'category_filter_bar.dart';

class CategoryBottomSheet extends StatefulWidget {
  const CategoryBottomSheet({super.key});

  @override
  State<CategoryBottomSheet> createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  double _selectedMaxPrice = 100;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).padding.bottom + 20,
      ),
      child: SizedBox(
        height: 405,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Filter', style: Styles.textStyle24),
                IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            Divider(height: 20),
            const Text('Sorted by', style: Styles.textStyle16),
            const SizedBox(height: 20),
            const CategoryFilterBar(),
            Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Max Price', style: Styles.textStyle16),
                Text(
                  '\$${_selectedMaxPrice.round()}',
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Slider(
              value: _selectedMaxPrice,
              min: 0,
              max: 100,
              divisions: 50,
              activeColor: Colors.black,

              onChanged: (double value) {
                setState(() {
                  _selectedMaxPrice = value;
                });
              },
            ),
            Divider(height: 20),
            const Spacer(),
            CustomButton(
              text: 'Apply',
              color: kPrimaryColor,
              textColor: Colors.white,
              width: double.infinity,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
