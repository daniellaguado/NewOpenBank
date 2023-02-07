import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/show_password.dart';
import '../../ui/input_decoration.dart';

class FormLoginPasswordField extends ConsumerWidget {
  const FormLoginPasswordField({
    Key? key,
    required this.showPass,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;
  final bool showPass;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: passwordController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: 7,
      autocorrect: false,
      obscureText: showPass,
      decoration: InputDecorations.decorations(
        labelText: 'Senha',
        suffixIcon: IconButton(
          onPressed: () {
            ref.read(showPasswordProvider.notifier).changeState();
          },
          icon: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              const iconOpenEyes = Icon(
                Icons.visibility_off_outlined,
                color: Colors.black54,
              );
              const iconCloseEyes = Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.black54,
              );
              final statepass = ref.watch(showPasswordProvider);
              final iconChange = statepass == true
                  ? iconOpenEyes
                  : FadeIn(
                      duration: const Duration(seconds: 1),
                      child: iconCloseEyes);
              return iconChange;
            },
          ),
        ),
      ),
      validator: ((value) {
        if (value == null || value.length <= 6) {
          return '';
        }
        return null;
      }),
    );
  }
}
