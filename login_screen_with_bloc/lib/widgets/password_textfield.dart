import 'package:flutter/material.dart';
import 'package:login_screen_with_bloc/blocs/login_bloc.dart';
import 'package:login_screen_with_bloc/blocs/login_event.dart';
import 'package:login_screen_with_bloc/blocs/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordTextfield extends StatelessWidget {
  const PasswordTextfield({super.key});
  
  final String hintTextPassword = "Şifre";
  final String passwordError = "Şifre çok kısa";


  @override
  Widget build(BuildContext context) {
   return  BlocBuilder<LoginBloc,LoginState>(
      builder: ((context,state) { 
    return  TextFormField(
      obscureText: true,
      decoration:  InputDecoration(
        icon: const Icon(Icons.key),
        hintText: hintTextPassword,
      ),
          validator: (value) => state.isValidPassword ? null : passwordError,
        onChanged: (value) => context
        .read<LoginBloc>()
        .add(LoginPasswordChanged(password: value)),
    );
      }),
    );
  }
}