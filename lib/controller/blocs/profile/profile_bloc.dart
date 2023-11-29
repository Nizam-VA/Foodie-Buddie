import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foodiebuddie/controller/api_services/profile/api_calls.dart';
import 'package:foodiebuddie/model/profile.dart';
import 'package:foodiebuddie/view/widgets/functions/snack_bar.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileEvent>((event, emit) async {
      final profile = await ProfileApiServices().getUserProfile();
      emit(ProfileState(profile: profile));
    });
    on<UpdateUserProfileEvent>((event, emit) async {
      final value = await ProfileApiServices().updateUser(event.profile);
      if (value) {
        showSnack(event.context, Colors.green, 'Updated profile successfully');
        final profile = await ProfileApiServices().getUserProfile();
        emit(ProfileState(profile: profile));
        Navigator.pop(event.context);
      } else {
        showSnack(event.context, Colors.red, 'This email is available.');
      }
    });
  }
}
