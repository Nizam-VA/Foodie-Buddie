part of 'address_bloc.dart';

class AddressState {
  final List<Address> addresses;
  final int? index;
  AddressState({required this.addresses, this.index = 0});
}

final class AddressInitial extends AddressState {
  AddressInitial() : super(addresses: []);
}
