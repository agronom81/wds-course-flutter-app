import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common/app_color.dart';
import '../../data/app_path.dart';
import '../../screens/login/bloc/login_cubit.dart';
import '../auth/forgot_password_text.dart';
import '../auth/have_account_text.dart';
import '../auth/signup_text.dart';
import '../custom_text.dart';
import '../empty.dart';
import '../primary_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.typeForm,
  });
  final String typeForm;

  final TextStyle labelStyle = const TextStyle(
    color: Color.fromRGBO(24, 23, 37, 1),
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  final InputDecoration inputStyle = const InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColor.loginBorderColor,
        width: 1.0,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColor.loginBorderColor,
        width: 1.0,
      ),
    ),
  );

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _hideText = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLogin = widget.typeForm == 'login';
    bool isSignup = widget.typeForm == 'signup';

    String title = '';
    String subtitle = '';
    String buttonTitle = '';
    if (isLogin) {
      title = 'Login';
      subtitle = 'Enter your email and password';
      buttonTitle = 'Log In';
    } else if (isSignup) {
      title = 'Sign Up';
      subtitle = 'Enter your credentials to continue';
      buttonTitle = 'Sign Up';
    }

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.go(AppPath.shop);
          return;
        }

        if (!state.isSuccess && !state.isLoading) {
          _showDialog(state.message);
        }
      },
      builder: (BuildContext context, LoginState state) {
        return Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: loginForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomText(
                  text: subtitle,
                  color: AppColor.textColor,
                ),
                const SizedBox(
                  height: 40,
                ),
                isSignup
                    ? Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: 'UserName',
                                color: AppColor.textColor,
                              ),
                              TextFormField(
                                controller: username,
                                style: widget.labelStyle,
                                decoration: widget.inputStyle,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter a User Name';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      )
                    : const Empty(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Email',
                      color: AppColor.textColor,
                    ),
                    TextFormField(
                      controller: email,
                      style: widget.labelStyle,
                      decoration: widget.inputStyle,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Password',
                      color: AppColor.textColor,
                    ),
                    TextFormField(
                      controller: password,
                      style: widget.labelStyle,
                      textInputAction: TextInputAction.done,
                      obscureText: _hideText,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field is empty';
                        }
                        return null;
                      },
                      decoration: widget.inputStyle.copyWith(
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
                isLogin
                    ? const ForgotPasswordText()
                    : const SizedBox(
                        height: 20,
                      ),
                isSignup ? const SignupText() : const Empty(),
                Builder(
                  builder: (BuildContext context) {
                    var loginState = context.watch<LoginCubit>().state;
                    if (loginState.isLoading) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    return PrimaryButton(
                      title: buttonTitle,
                      action: _login,
                    );
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                HaveAccountText(
                  isLogin: isLogin,
                  isSignup: isSignup,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _toggleHide() {
    setState(() {
      _hideText = !_hideText;
    });
  }

  void _login() {
    if (widget.typeForm == 'login') {
      if (loginForm.currentState?.validate() == true) {
        String emailValue = email.text;
        String passwordValue = password.text;

        context.read<LoginCubit>().login(
              login: emailValue,
              password: passwordValue,
            );
      }
    }

    if (widget.typeForm == 'signup') {
      if (loginForm.currentState?.validate() == true) {
        String emailValue = email.text;
        String passwordValue = password.text;
        String userNameValue = username.text;

        context.read<LoginCubit>().signup(
              email: emailValue,
              password: passwordValue,
              username: userNameValue,
            );
      }
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

  _showDialog(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: CustomText(
              text: message,
            ),
            actions: [
              FilledButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Ok'))
            ],
          );
        });
  }
}
