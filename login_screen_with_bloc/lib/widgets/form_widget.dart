import 'package:flutter/material.dart';
import 'package:login_screen_with_bloc/widgets/login_button.dart';
import 'package:login_screen_with_bloc/widgets/password_textfield.dart';
import 'package:login_screen_with_bloc/widgets/username_textfield.dart';

class FormWidget extends StatelessWidget {
   FormWidget({super.key});


  final GlobalKey _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child:   Column(
           children: [
            const UsernameTextfield(),
            const PasswordTextfield(),
            const SizedBox(height: 15,),
            LoginButton(formKey: _formKey,)
           ],
      ),
      );
  }
}