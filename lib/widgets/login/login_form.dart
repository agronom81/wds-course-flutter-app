import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common/app_color.dart';
import '../../screens/login/bloc/login_bloc.dart';
import '../custom_text.dart';
import '../empty.dart';
import '../primary_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _hideText = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is LoginStateSuccess) {
          context.goNamed('home');
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: loginForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Logging',
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomText(
                text: 'Enter your emails and password',
                color: AppColor.textColor,
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Email',
                    color: AppColor.textColor,
                  ),
                  TextFormField(
                    controller: email,
                    style: const TextStyle(
                      color: Color.fromRGBO(24, 23, 37, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(226, 226, 226, 1),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(226, 226, 226, 1),
                          width: 1.0,
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (_validateEmail(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) {
                if (previous is LoginStateError &&
                        current is! LoginStateError ||
                    previous is! LoginStateError &&
                        current is LoginStateError) {
                  return true;
                }
                return false;
              }, builder: (context, state) {
                if (state is LoginStateError) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(state.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        )),
                  );
                }
                return const Empty();
              }),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Password',
                    color: AppColor.textColor,
                  ),
                  TextFormField(
                    controller: password,
                    style: const TextStyle(
                      color: Color.fromRGBO(24, 23, 37, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textInputAction: TextInputAction.done,
                    obscureText: _hideText,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field is empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(226, 226, 226, 1),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(226, 226, 226, 1),
                          width: 1.0,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: GestureDetector(
                          onTap: _toggleHide,
                          child: Icon(
                            !_hideText
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, bottom: 30),
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {},
                  child: const CustomText(
                    text: 'Forgot Password',
                    fontSize: 14,
                  ),
                ),
              ),
              PrimaryButton(
                title: 'Log In',
                action: _login,
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                      text: 'Don\'t have an account?',
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const CustomText(
                      text: 'Signup',
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(83, 177, 117, 1),
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _toggleHide() {
    setState(() {
      _hideText = !_hideText;
    });
  }

  void _login() {
    if (loginForm.currentState?.validate() == true) {
      String emailValue = email.text;
      String passwordValue = password.text;

      context.read<LoginBloc>().add(LoginEmailEvent(
            login: emailValue,
            pass: passwordValue,
          ));
    }
  }

  bool _validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isEmpty || !regex.hasMatch(value) ? true : false;
  }
}
