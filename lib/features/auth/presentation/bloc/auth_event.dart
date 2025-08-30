part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  String email;
  String password;

  LoginEvent(this.email, this.password);
}
