import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wds_first_app/icons/carrot.dart';

import '../widgets/custom_text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _hideText = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/loginBg.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 230,
                child: SvgPicture.string(
                  carrot,
                  width: 47,
                  height: 55,
                ),
              ),
              Padding(
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
                        color: Color.fromRGBO(124, 124, 124, 1),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: 'Email',
                            color: Color.fromRGBO(124, 124, 124, 1),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: 'Password',
                            color: Color.fromRGBO(124, 124, 124, 1),
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
                      SizedBox(
                        width: double.infinity,
                        height: 67,
                        child: FilledButton(
                          style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19.0),
                              ),
                            ),
                          ),
                          onPressed: _login,
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
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

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$emailValue:$passwordValue'),
      ));

      context.goNamed('shop');
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