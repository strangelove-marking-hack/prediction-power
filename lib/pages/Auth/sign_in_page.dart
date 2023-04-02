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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Войти', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 251, 188, 5)),),
                      const SizedBox(height: 8,),
                      const Text('Введите ваш логин и пароль, чтобы войти!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 158, 166, 190)),),
                      const SizedBox(height: 36,),
                      Container(
                        color: const Color.fromARGB(255, 244, 247, 254),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            onTap: (){},
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Image.asset('assets/images/auth_page/Vk.png', width: 20,),
                                const SizedBox(width: 8,),
                                const Text('Войти с помощью Vk', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 158, 166, 190)),),
                              ]),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40,),
                      PrimaryTextField(
                        controller: _textFormLoginController,
                        labelText: 'Электронная почта',
                        labelStyle: TextStyle(),
                        validator: (ex) {},
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      PrimaryTextField(
                        obscureText: true,
                        controller: _textFormPasswordController,
                        labelText: 'Пароль',
                        labelStyle: TextStyle(),
                        validator: (ex) {},
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      //LOG
                      // Container(
                      //   color: Color.fromARGB(255, 93, 136, 212),
                      //   child: Material(
                      //     color: Colors.transparent,
                      //     child: InkWell(
                      //       onTap: () {
                      //         // if (_formKey.currentState!.validate()) {
                      //         context.read<SignInBloc>().add(
                      //               SignInAuth(
                      //                 username: _textFormLoginController.text,
                      //                 password:
                      //                     _textFormPasswordController.text,
                      //               ),
                      //             );
                      //         // }
                      //       },
                      //       child: Container(
                      //         height: 50,
                      //         child: Center(child: Text('LogIn')),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        color: Color.fromARGB(255, 251, 188, 5),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            onTap: (){
                              context.read<SignInBloc>().add(
                                    SignInAuth(
                                      username: _textFormLoginController.text,
                                      password:
                                          _textFormPasswordController.text,
                                    ),
                                  );
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Войти', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),)
                              ]),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //REG
                      Row(children: [
                        Text('Не зарегестрирован? ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,)),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: (){
                              context.go(Routes.signUpPage);
                            },
                            child: Text('Создать аккаунт', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 251, 188, 5)))),
                        ),
                      ],),

                      // Container(
                      //   color: Color.fromARGB(255, 173, 193, 202),
                      //   child: Material(
                      //     color: Colors.transparent,
                      //     child: InkWell(
                      //       onTap: () {
                      //         context.go(Routes.signUpPage);
                      //       },
                      //       child: Container(
                      //         height: 50,
                      //         child: Center(child: Text('Registration')),
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
