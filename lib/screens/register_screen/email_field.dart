import 'package:flutter/material.dart';
import 'package:openbank/ui/input_decoration.dart';

class FormEmailField extends StatelessWidget {
  const FormEmailField({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecorations.decorations(labelText: 'Email'),
      validator: (value) {
        String pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

        RegExp regExp = RegExp(pattern);

        return regExp.hasMatch(value ?? '') ? null : '';
      },
    );
  }
}
