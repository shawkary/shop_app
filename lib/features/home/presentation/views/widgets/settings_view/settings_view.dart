import 'package:flutter/material.dart';
import 'package:ibrahim_project/core/custom_widgets/custom_button.dart';
import 'package:ibrahim_project/core/custom_widgets/custom_text_field.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomTextFormField(
              label: 'name',
              keyboardType: TextInputType.name,
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: 20),
            const CustomTextFormField(
              label: 'email',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 20),
            const CustomTextFormField(
              label: 'phone',
              keyboardType: TextInputType.phone,
              prefixIcon: Icons.phone,
            ),
            const SizedBox(height: 30),
            CustomButton(
                onPressed: (){},
              text: 'Update',
            ),
            const SizedBox(height: 100),
            CustomButton(
              onPressed: (){},
              text: 'Logout',
              color: Colors.redAccent,
            )
          ],
        ),
      ),
    );
  }
}
