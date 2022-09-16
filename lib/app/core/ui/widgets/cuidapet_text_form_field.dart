import 'package:adf_cuidapet/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class CuidapetTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String label;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;

  CuidapetTextFormField({
    Key? key,
    required this.label,
    this.controller,
    this.validator,
    this.obscureText = false,
  })  : _obscureTextVN = ValueNotifier<bool>(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextVNValue, child) {
        return TextFormField(
          controller: controller,
          obscureText: obscureTextVNValue,
          validator: validator,
          decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                // gapPadding: 0,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                // gapPadding: 0,
                borderSide: const BorderSide(color: Colors.grey),
              ),
              suffixIcon: obscureText
                  ? IconButton(
                      onPressed: () {
                        _obscureTextVN.value = !obscureTextVNValue;
                      },
                      icon: Icon(
                        obscureTextVNValue ? Icons.lock : Icons.lock_open,
                        color: context.primaryColor,
                      ),
                    )
                  : null),
        );
      },
    );
  }
}
