part of 'address_bloc.dart';

class AddressState {
  final List<Address> addresses;
  AddressState({required this.addresses});
}

final class AddressInitial extends AddressState {
  AddressInitial() : super(addresses: []);
}
