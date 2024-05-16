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
                  // key: formKey,
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
                      TextFormField(
                        style: const TextStyle(
                          color: Color.fromRGBO(24, 23, 37, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        // controller: login,
                        // focusNode: focus,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field is empty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          label: Text(
                            'Email',
                          ),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Color.fromRGBO(24, 23, 37, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        // controller: password,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field is empty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          label: Text('Password'),
                          // prefixIcon: Icon(Icons.email),
                          // isDense: true,
                          // contentPadding: EdgeInsets.zero,
                          // fillColor: Colors.blue,
                          // filled: true,
                        ),
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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

  void _login() {
    context.goNamed('shop');
  }
}
