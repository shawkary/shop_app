import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.prefixIcon,
    this.label = '',
  });

  final IconData? prefixIcon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: Text(label),
            prefixIcon: Icon(prefixIcon)
        ),
      ),
    );
  }
}
