part of 'address_bloc.dart';

class AddressEvent {}

final class AddAddressEvent extends AddressEvent {
  final Address address;
  final BuildContext context;
  AddAddressEvent({required this.address, required this.context});
}

final class UpdateAddressEvent extends AddressEvent {
  final Address address;
  final BuildContext context;
  UpdateAddressEvent({required this.address, required this.context});
}

final class GetAllAddressEvent extends AddressEvent {}

final class SelectAddressEvent extends AddressEvent {
  final int index;
  SelectAddressEvent({required this.index});
}
