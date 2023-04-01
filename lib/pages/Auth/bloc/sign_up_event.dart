part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpReg extends SignUpEvent {
  final String username;
  final String password;
  final String email;
  final String fio;
  final String phone;

  SignUpReg({
    required this.username,
    required this.password,
    required this.email,
    required this.fio,
    required this.phone,
  });
}
