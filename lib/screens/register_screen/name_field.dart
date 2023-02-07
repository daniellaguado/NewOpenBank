import 'package:flutter/material.dart';
import 'package:openbank/ui/input_decoration.dart';

class FormNameField extends StatelessWidget {
  const FormNameField({
    Key? key,
    required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: nameController,
      decoration: InputDecorations.decorations(labelText: 'Nome Completo'),
      validator: (value) {
        String pattern =
            r'^([A-Za-zÑñÃãÁáÉéÍíÕõÓóÚú]+[\-]{0,1}[A-Za-zÑñÃãÁáÉéÍíÕõÓóÚú]+)(\s+([A-Za-zÑñÃãÁáÉéÍíÕõÓóÚú]+[\-]{0,1}[A-Za-zÑñÃãÁáÉéÍíÕõÓóÚú]+))*$';

        RegExp regExp = RegExp(pattern);

        return regExp.hasMatch(value ?? '') ? null : '';
      },
    );
  }
}
