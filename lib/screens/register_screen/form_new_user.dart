import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../models/user_models.dart';
import '../../providers/auth_form.dart';
import '../../providers/show_password.dart';
import '../../services/firestore_services.dart';
import 'cpf_field.dart';
import 'date_field.dart';
import 'email_field.dart';
import 'name_field.dart';
import 'password_field.dart';

// ignore: must_be_immutable
class NewUser extends ConsumerStatefulWidget {
  const NewUser({super.key});

  @override
  ConsumerState<NewUser> createState() => _UserRegState();
}

class _UserRegState extends ConsumerState<NewUser> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController cpfController = TextEditingController(text: '');
  TextEditingController dataController = TextEditingController(text: '');
  TextEditingController imgProfileController = TextEditingController(text: '');

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    cpfController.dispose();
    dataController.dispose();
    imgProfileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showPass = ref.watch(showPasswordProvider);
    final registerKey = ref.watch(registerKeyProvider);

    var inputFormattersCpf = MaskTextInputFormatter(
        mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
    var inputFormattersDate = MaskTextInputFormatter(
        mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
    const sizedBox = SizedBox(
      height: 20,
    );
    return Scaffold(
      body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
          child: Column(
            children: [
              Container(
                height: 50,
              ),
              Expanded(
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: registerKey.registerFormKey,
                      // key: _formKey,
                      child: Column(
                        children: [
                          sizedBox,
                          //========================================== COMPLETE NAME FIELD ==============================

                          FormNameField(nameController: nameController),
                          sizedBox,

                          //========================================== CPF FIELD =================================
                          FormCpfField(
                              cpfController: cpfController,
                              inputFormattersCpf: inputFormattersCpf),

                          //========================================== EMAIL FIELD =================================

                          FormEmailField(emailController: emailController),
                          sizedBox,

                          //========================================== DATE FIELD =================================
                          FormDateField(
                              dataController: dataController,
                              inputFormattersDate: inputFormattersDate),

                          sizedBox,
                          //========================================== PASSWORD FIELD ==============================
                          FormPasswordField(
                            showPass: showPass,
                            passwordController: passwordController,
                          ),
                          sizedBox,

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.only(left: 60, right: 60),
                              primary: const Color.fromRGBO(86, 13, 50, 1),
                            ),
                            onPressed: () async {
                              if (registerKey.registerFormKey.currentState!
                                      .validate() ==
                                  true) {
                                _singUpUser();
                                Navigator.pushReplacementNamed(context, 'home');
                              }
                            },
                            child: const Text('Criar conta'),
                          ),
                          sizedBox,

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account?'),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, 'login');
                                },
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: Color.fromRGBO(86, 13, 50, 1),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void _singUpUser() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          )
          .then((value) => FirestoreHelper.create(UserModel(
                email: emailController.text,
                name: nameController.text,
                cpf: cpfController.text,
                data: dataController.text,
                imgProfile: imgProfileController.text,
              )));
    } catch (e) {
      print(e);
    }
  }
}








//
//
