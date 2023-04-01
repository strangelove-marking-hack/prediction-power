import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';

import '../../service/auth_service.dart';
import '../../ui/textfields.dart';
import '../../utils/app_routes.dart';
import 'bloc/sign_in_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final authService = Injector().get<AuthService>();
  final _textFormLoginController = TextEditingController();
  final _textFormPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(authService: authService),
      child: Scaffold(
        body: BlocConsumer<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInError) {
              _showSnackBar(context: context, text: state.error);
            } else if (state is SignInSuccess) {
              context.go(Routes.mainPage);
            }
          },
          builder: (context, state) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 500.0, vertical: 50),
              child: Center(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      PrimaryTextField(
                        controller: _textFormLoginController,
                        labelText: 'login',
                        labelStyle: TextStyle(),
                        validator: (ex) {},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PrimaryTextField(
                        obscureText: true,
                        controller: _textFormPasswordController,
                        labelText: 'password',
                        labelStyle: TextStyle(),
                        validator: (ex) {},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //LOG
                      Container(
                        color: Color.fromARGB(255, 93, 136, 212),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              // if (_formKey.currentState!.validate()) {
                              context.read<SignInBloc>().add(
                                    SignInAuth(
                                      username: _textFormLoginController.text,
                                      password:
                                          _textFormPasswordController.text,
                                    ),
                                  );
                              // }
                            },
                            child: Container(
                              height: 50,
                              child: Center(child: Text('LogIn')),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //REG
                      Container(
                        color: Color.fromARGB(255, 173, 193, 202),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              context.go(Routes.signUpPage);
                            },
                            child: Container(
                              height: 50,
                              child: Center(child: Text('Registration')),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _showSnackBar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
