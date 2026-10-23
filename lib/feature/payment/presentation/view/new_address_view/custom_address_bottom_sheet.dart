import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';
import '../../manger/address_cubit/address_cubit.dart';

class CustomAddressBottomSheet extends StatelessWidget {
  const CustomAddressBottomSheet({super.key, required this.fullAddress});
  final String fullAddress;
  @override
  Widget build(BuildContext context) {
    String addressNickName = 'Home';
    return SizedBox(
      height: 390,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text('Address', style: Styles.textStyle20),
                IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  icon: const Icon(Icons.close, size: 33),
                ),
              ],
            ),
            const SizedBox(height: 20, child: Divider()),
            Text(
              'Address Nickname',
              style: Styles.textStyle20.copyWith(fontWeight: .w400),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'Home',
              readOnly: false,
              onChanged: (value) {
                addressNickName = value;
              },
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 20, child: Divider()),
            Text(
              'Full Address',
              style: Styles.textStyle20.copyWith(fontWeight: .w400),
            ),
            const SizedBox(height: 10),
            CustomTextField(hintText: fullAddress, readOnly: true),
            const Spacer(),
            CustomButton(
              text: 'Add',
              color: Colors.black,
              textColor: Colors.white,
              width: 500,
              onTap: () {
                context.read<AddressCubit>().addNewAddress(
                  addressNickName,
                  fullAddress,
                );

                GoRouter.of(context).pop();
                GoRouter.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
