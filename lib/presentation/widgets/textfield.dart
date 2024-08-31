// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fullstack_taskmanagement/core/theme/app_palette.dart';

class AuthTextField extends StatelessWidget {
  final String labelTextField;
  final IconData iconTextField;
  final bool obscureTextValue;
  final TextEditingController textFieldController;

  const AuthTextField({
    super.key,
    required this.labelTextField,
    required this.iconTextField,
    this.obscureTextValue = false,
    required this.textFieldController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(),
      child: TextFormField(
        controller: textFieldController,
        obscureText: obscureTextValue,
        decoration: InputDecoration(
          labelText: labelTextField,
          labelStyle: TextStyle(
            color: AppPalette.fontColorPrimary,
          ),
          suffixIcon: Icon(
            iconTextField,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppPalette.fontColorPrimary,
            ),
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
