import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    this.controller,
    this.onChanged,
    this.hint,
    super.key,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    final hint = this.hint;

    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).primaryColor,
        hint: hint != null ? Text(hint) : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).focusColor),
          borderRadius: BorderRadius.circular(120),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).cardColor),
          borderRadius: BorderRadius.circular(120),
        ),
      ),
    );
  }
}
