import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/app_settings.dart';
import '../../widgets/login/login_form.dart';

class Auth extends StatelessWidget {
  Auth({
    super.key,
    required this.typeForm,
  });
  final String typeForm;

  final AppSettings settings = AppSettings();

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
              LoginForm(typeForm: typeForm)
            ],
          ),
        ),
      ),
    );
  }
}