part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInAuth extends SignInEvent {
  final String username;
  final String password;

  SignInAuth({
    required this.username,
    required this.password,
  });
}