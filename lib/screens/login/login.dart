import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wds_first_app/common/app_preferences.dart';

import '../../widgets/login/login_form.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    _checkToken();
  }

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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 230,
                child: SvgPicture.asset(
                  'icons/carrot.svg',
                  width: 47,
                  height: 55,
                ),
              ),
              const LoginForm()
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _checkToken() async {
    String? token = await AppPreferences.getToken();

    if (token != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/shop');
      });
    }
  }
}
