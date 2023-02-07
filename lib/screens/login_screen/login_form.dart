import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/auth_form.dart';
import '../../providers/show_password.dart';
import 'email_field.dart';
import 'password_field.dart';

// final _loginKey = GlobalKey<FormState>();

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _UserLoginState();
}

class _UserLoginState extends ConsumerState<LoginPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showPass = ref.watch(showPasswordProvider);
    final loginKey = ref.watch(loginKeyProvider);

    @override
    const sizedBox = SizedBox(
      height: 20,
    );
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Login Page'),
        //   centerTitle: true,
        // ),
        body: Column(
      children: [
        Container(
          width: double.infinity,
          color: const Color.fromRGBO(86, 13, 50, 1),
          height: 160,
          child: const Icon(
            Icons.all_inclusive,
            size: 100,
            color: Color.fromARGB(255, 199, 199, 199),
          ),
        ),
        const SizedBox(height: 40),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Form(
                      key: loginKey.loginFormKey,
                      child: Column(
                        children: [
                          FormLoginEmailField(
                            emailController: emailController,
                          ),
                          sizedBox,
                          FormLoginPasswordField(
                            passwordController: passwordController,
                            showPass: showPass,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.only(left: 60, right: 60),
                              primary: const Color.fromRGBO(86, 13, 50, 1),
                            ),
                            onPressed: () async {
                              if (loginKey.loginFormKey.currentState!
                                      .validate() ==
                                  true) {
                                singInUser();
                              }
                            },
                            child: const Text('Entrar'),
                          ),
                          sizedBox,
                          const Text('Ainda não tem conta no OpenBank?'),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () async {
                              Navigator.pushReplacementNamed(
                                  context, 'adduser');

                              // widget.onTapClickListener;
                            },
                            child: const Text(
                              'Criar conta',
                              style: TextStyle(
                                  color: Color.fromRGBO(86, 13, 50, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }

  void singInUser() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          )
          .then((value) => Navigator.pushReplacementNamed(context, 'main'));
      // ignore: empty_catches
    } catch (e) {}
  }
}




//
//
