import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/login/presentation/views/widgets/custom_button.dart';
import 'custom_text_field.dart';


class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomTextFormField(
                  prefixIcon: Icons.email,
                  label: 'Email',
                ),
                const SizedBox(height: 20),
                const CustomTextFormField(
                  prefixIcon: Icons.lock,
                  label: 'Password',
                ),
                const SizedBox(height: 40),
                CustomButton(
                  onPressed: (){},
                  text: 'Login',
                ),
              ],
            )
        )
    );
  }
}
