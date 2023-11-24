import 'package:flutter/material.dart';
import 'package:login_screen_with_bloc/blocs/login_bloc.dart';
import 'package:login_screen_with_bloc/blocs/login_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen_with_bloc/blocs/login_state.dart';

class UsernameTextfield extends StatelessWidget {
  const UsernameTextfield({super.key});
  
  final String hintTextUsername = "Kullanıcı Adı";
  final String usernameError = "Kullanıcı adı çok kısa";

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LoginBloc,LoginState>(
      builder: ((context,state) { 
        return TextFormField(
        decoration:  InputDecoration(
          icon: const Icon(Icons.person),
          hintText: hintTextUsername, 
        ),
        validator: (value) => state.isValidUsername ? null : usernameError,
        onChanged: (value) => context
        .read<LoginBloc>()
        .add(LoginUsernameChanged(username: value)),
      );
      }),
    );
  }
}