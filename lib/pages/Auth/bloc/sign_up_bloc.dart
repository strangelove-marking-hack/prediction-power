import 'dart:js';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../service/auth_service.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthService authService;

  SignUpBloc({
    required this.authService,
  }) : super(SignUpInitial()) {
    on<SignUpEvent>(
      (event, emit) async {
        String response = 'Ошибка! Попробуйте еще раз.';

        if (event is SignUpReg) {
          emit(SignUpLoading());
          response = await authService.regUser(
            username: event.username,
            password: event.password,
            email: event.email,
            fio: event.fio,
            phone: event.phone,
          );
        }
        if (response.contains("Token: ")) {
          emit(SignUpSuccess(token: response));
        } else {
          emit(SignUpError(error: response));
        }
      },
    );
  }
}
