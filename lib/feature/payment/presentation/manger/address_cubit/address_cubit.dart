import 'package:delivery/core/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  String addressNickName = 'Home';
  String fullAddress = 'No Address selected';
  void addNewAddress(String addressNickName, String fullAddress) {
    this.addressNickName = addressNickName;
    this.fullAddress = fullAddress;
    Hive.box(kBasicBox).put(kAddressNickNameBox, addressNickName);
    Hive.box(kBasicBox).put(kFullAddressBox, fullAddress);
    emit(
      AddressSuccess(
        addressNickName: addressNickName,
        fullAddress: fullAddress,
      ),
    );
  }

  void getAddress() {
    addressNickName = Hive.box(
      kBasicBox,
    ).get(kAddressNickNameBox, defaultValue: 'Home');
    fullAddress = Hive.box(
      kBasicBox,
    ).get(kFullAddressBox, defaultValue: 'No address selected yet');
    emit(
      AddressSuccess(
        addressNickName: addressNickName,
        fullAddress: fullAddress,
      ),
    );
  }
}
