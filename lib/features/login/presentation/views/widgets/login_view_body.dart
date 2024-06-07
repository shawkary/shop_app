import 'package:flutter/material.dart';
import 'custom_text_field.dart';


class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  prefixIcon: Icons.email,
                  label: 'Email',
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  prefixIcon: Icons.lock,
                  label: 'Password',
                ),
              ],
            )
        )
    );
  }
}
