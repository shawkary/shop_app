import 'package:flutter/material.dart';
import '../../../../login/presentation/views/widgets/custom_button.dart';
import '../../../../login/presentation/views/widgets/custom_text_field.dart';


class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const CustomTextFormField(
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.name,
                    label: 'Name',
                  ),
                  const SizedBox(height: 20),
                  const CustomTextFormField(
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    label: 'Phone',
                  ),
                  const SizedBox(height: 20),
                  const CustomTextFormField(
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    label: 'Email',
                  ),
                  const SizedBox(height: 20),
                  const CustomTextFormField(
                    prefixIcon: Icons.lock,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    label: 'Password',
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    onPressed: ()
                    {
                      if(formKey.currentState!.validate()){

                      }
                    },
                    text: 'Register',
                  ),
                ],
              ),
            )
        )
    );
  }
}
