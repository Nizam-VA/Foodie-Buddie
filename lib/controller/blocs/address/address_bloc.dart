import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foodiebuddie/controller/api_services/address/api_calls.dart';
import 'package:foodiebuddie/model/address.dart';
import 'package:foodiebuddie/view/widgets/functions/snack_bar.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(AddressInitial()) {
    on<AddAddressEvent>((event, emit) async {
      final value = await AddressApiServices().addAddress(event.address);
      if (value) {
        final addresses = await AddressApiServices().fetchAllAddresses();
        emit(AddressState(addresses: addresses));
        showSnack(event.context, Colors.green, 'Address Added Successfully.');
        Navigator.of(event.context).pop();
      } else {
        showSnack(event.context, Colors.red, "Can't able to Add address.");
      }
    });
    on<UpdateAddressEvent>((event, emit) async {
      final value = await AddressApiServices().updateAddress(event.address);
      if (value) {
        final addresses = await AddressApiServices().fetchAllAddresses();
        emit(AddressState(addresses: addresses));
        showSnack(event.context, Colors.green, 'Address Added Successfully.');
        Navigator.of(event.context).pop();
      } else {
        showSnack(event.context, Colors.red, "Can't able to Add address.");
      }
    });
    on<GetAllAddressEvent>((event, emit) async {
      final addresses = await AddressApiServices().fetchAllAddresses();
      emit(AddressState(addresses: addresses));
    });
    on<SelectAddressEvent>((event, emit) async {
      final addresses = await AddressApiServices().fetchAllAddresses();
      emit(AddressState(addresses: addresses, index: event.index));
    });
  }
}
