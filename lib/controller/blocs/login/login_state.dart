part of 'login_bloc.dart';

class LoginState {
  bool isLoading;
  LoginState({this.isLoading = false});
}

final class LoginInitial extends LoginState {
  LoginInitial() : super(isLoading: true);
}
