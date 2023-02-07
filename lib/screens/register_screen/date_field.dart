import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:openbank/ui/input_decoration.dart';

class FormDateField extends StatelessWidget {
  const FormDateField({
    Key? key,
    required this.dataController,
    required this.inputFormattersDate,
  }) : super(key: key);

  final TextEditingController dataController;
  final MaskTextInputFormatter inputFormattersDate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: dataController,
      inputFormatters: [inputFormattersDate],
      keyboardType: TextInputType.phone,
      decoration: InputDecorations.decorations(
        labelText: 'Data de nascimento',
        hintText: 'dd/mm/yyyy',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '';
        }
        final components = value.split("/");
        if (components.length == 3) {
          final day = int.tryParse(components[0]);
          final month = int.tryParse(components[1]);
          final year = int.tryParse(components[2]);
          if (day != null && month != null && year != null) {
            final date = DateTime(year, month, day);
            if (date.year == year && date.month == month && date.day == day) {
              return null;
            }
          }
        }
        return '';
      },
    );
  }
}
