import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wds_first_app/icons/carrot.dart';

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
            fit: BoxFit.cover,
          ),
        ),
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
                  children: [
                    TextFormField(
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
                        // prefixIcon: Icon(Icons.email),
                        hintText: 'Email',
                        // isDense: true,
                        contentPadding: EdgeInsets.zero,
                        // fillColor: Colors.red,
                        // filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
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
                        // prefixIcon: Icon(Icons.email),
                        hintText: 'Password',
                        // isDense: true,
                        // contentPadding: EdgeInsets.zero,
                        // fillColor: Colors.blue,
                        // filled: true,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FilledButton(onPressed: _login, child: const Text('Log In'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    context.goNamed('shop');
  }
}
