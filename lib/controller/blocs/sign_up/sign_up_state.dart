part of 'sign_up_bloc.dart';

class SignUpState {
  bool isLoading;
  SignUpState({this.isLoading = false});
}

final class SignUpInitial extends SignUpState {
  SignUpInitial() : super(isLoading: true);
}
