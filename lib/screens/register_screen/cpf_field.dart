import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:openbank/ui/input_decoration.dart';

class FormCpfField extends StatelessWidget {
  const FormCpfField({
    Key? key,
    required this.cpfController,
    required this.inputFormattersCpf,
  }) : super(key: key);

  final TextEditingController cpfController;
  final MaskTextInputFormatter inputFormattersCpf;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: cpfController,
      inputFormatters: [inputFormattersCpf],
      maxLength: 14,
      keyboardType: TextInputType.phone,
      decoration: InputDecorations.decorations(
          labelText: 'C.P.F', counter: const Text('')),
      validator: (value) {
        if (value == null || value.length > 13) {
          return null;
        }
        return '';
      },
    );
  }
}
