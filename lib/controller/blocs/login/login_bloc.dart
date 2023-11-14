import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foodiebuddie/controller/api_services/sign_up_login/api_calls.dart';
import 'package:foodiebuddie/view/screen/main/screen_main.dart';
import 'package:foodiebuddie/view/widgets/functions/snack_bar.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      final value = await ApiServices().login(event.email, event.password);
      if (value) {
        emit(LoginState(isLoading: false));
        showSnack(event.context, Colors.green, 'Logged successfully');
        Navigator.of(event.context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ScreenMain(),
          ),
        );
      } else {
        showSnack(event.context, Colors.red, 'Invalid entries');
      }
    });
  }
}
