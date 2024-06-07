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
        validator: (value) {
          if(value!.isEmpty){
            return 'This field must not be empty!';
          }
          return null;
        },
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: Text(label),
            prefixIcon: Icon(prefixIcon),
        ),
      ),
    );
  }
}
