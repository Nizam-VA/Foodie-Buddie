part of 'login_bloc.dart';

class LoginEvent {
  String email;
  String password;
  BuildContext context;
  LoginEvent(
      {required this.email, required this.password, required this.context});
}
