import 'package:flutter/material.dart';
import 'package:wds_first_app/api/server_api.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode focus = FocusNode();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  ServerApi api = ServerApi();

  @override
  void initState() {
    // login.addListener(() {
    //   print('Login Change');
    // });
    // focus.addListener(() {
    //   if (focus.hasFocus) {
    //     print('has focus');
    //   }
    // });
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    login.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: login,
                focusNode: focus,
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
                controller: password,
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
              FilledButton(onPressed: _send, child: const Text('Send'))
            ],
          ),
        ),
      ),
    );
  }

  void _send() {
    if (formKey.currentState?.validate() == true) {
      String loginText = login.text;
      String passwordText = password.text;

      api.login(login: loginText, password: passwordText).then((value) {
        if (value.code >= 200 && value.code < 300) {
        } else {}
      });

      // http.post(
      //   'https://it-flutter.wdscode.guru/wp-json/flutter/v1/login',
      //   data: {
      //     "username": loginText,
      //     "password": passwordText,
      //   },
      // ).then((value) {
      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text('Success'),
      //   ));
      //   print('value $value');
      // }).onError((error, stackTrace) {
      //   if (error is DioException) {
      //     print('onError ${(error as DioException).response?.data}');
      //   }
      // });

      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text('Data Sended $loginText:$passwordText'),
      // ));
    }
  }
}
