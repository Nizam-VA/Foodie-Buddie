import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foodiebuddie/controller/api_services/sign_up_login/api_calls.dart';
import 'package:foodiebuddie/model/user.dart';
import 'package:foodiebuddie/view/screen/main/screen_main.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      bool value = await ApiServices().signUp(event.user);
      if (value) {
        emit(SignUpState(isLoading: false));
        Navigator.of(event.context).push(
          MaterialPageRoute(
            builder: (context) => ScreenMain(),
          ),
        );
        ScaffoldMessenger.of(event.context).showSnackBar(
          SnackBar(
            content: const Text('Account created successfully'),
          ),
        );
      }
    });
  }
}
