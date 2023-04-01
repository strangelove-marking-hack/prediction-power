import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';

import '../../service/auth_service.dart';
import '../../ui/textfields.dart';
import '../../utils/app_routes.dart';
import 'bloc/sign_up_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final authService = Injector().get<AuthService>();

  final _textFormUserNameController = TextEditingController();
  final _textFormPasswordController = TextEditingController();
  final _textFormEmailController = TextEditingController();
  final _textFormFioController = TextEditingController();
  final _textFormPhoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(authService: authService),
      child: Scaffold(
        body: BlocConsumer<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpError) {
              _showSnackBar(context: context, text: state.error);
            } else if (state is SignUpSuccess) {
              context.go(Routes.mainPage);
            }
          },
          builder: (context, state) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 500.0, vertical: 50),
              child: Center(
                child: Column(
                  children: <Widget>[
                    PrimaryTextField(
                      controller: _textFormUserNameController,
                      labelText: 'login',
                      labelStyle: TextStyle(),
                      validator: (ex) {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PrimaryTextField(
                      obscureText: true,
                      controller: _textFormPasswordController,
                      labelText: 'password',
                      labelStyle: TextStyle(),
                      validator: (ex) {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PrimaryTextField(
                      controller: _textFormEmailController,
                      labelText: 'email',
                      labelStyle: TextStyle(),
                      validator: (ex) {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PrimaryTextField(
                      controller: _textFormFioController,
                      labelText: 'fio',
                      labelStyle: TextStyle(),
                      validator: (ex) {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PrimaryTextField(
                      controller: _textFormPhoneController,
                      labelText: 'phone',
                      labelStyle: TextStyle(),
                      validator: (ex) {},
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
                            // if (_formKey.currentState!.validate()) {
                            context.read<SignUpBloc>().add(
                                  SignUpReg(
                                    username: _textFormUserNameController.text,
                                    password: _textFormPasswordController.text,
                                    email: _textFormEmailController.text,
                                    fio: _textFormFioController.text,
                                    phone: _textFormPhoneController.text,
                                  ),
                                );
                            // }
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
