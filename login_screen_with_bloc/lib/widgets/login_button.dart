import 'package:flutter/material.dart';
import 'package:login_screen_with_bloc/auth/form_submission_status.dart';
import 'package:login_screen_with_bloc/blocs/login_bloc.dart';
import 'package:login_screen_with_bloc/blocs/login_event.dart';
import 'package:login_screen_with_bloc/blocs/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.formKey});
  
 final dynamic formKey;
 final String girisYapText = "Giriş Yap";

  @override
  Widget build(BuildContext context) {
     return  BlocBuilder<LoginBloc,LoginState>(
      builder: ((context,state) { 
       return state.formStatus is FormSubmitting 
       ? const Center(child: CircularProgressIndicator())
       : ElevatedButton(onPressed: () {  
        if (formKey.currentState!.validate()) 
        {
             context.read<LoginBloc>().add(LoginSubmitted());
        }
        }, child:  Text(girisYapText));
      }),
    );
  }
}