import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen_with_bloc/auth/form_submission_status.dart';
import 'package:login_screen_with_bloc/blocs/login_bloc.dart';
import 'package:login_screen_with_bloc/blocs/login_state.dart';
import 'package:login_screen_with_bloc/repository/login_repository.dart';
import 'package:login_screen_with_bloc/widgets/form_widget.dart';

class LoginScreen extends StatelessWidget {
const LoginScreen({super.key});

 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset:false,
      body: BlocProvider(
        create: (context) => LoginBloc(authRepo: context.read<LoginRepository>()),
        child: BlocListener<LoginBloc,LoginState>(
          listenWhen:((previous, current) => 
          previous.formStatus != current.formStatus),
          listener: (context, state) {
            final formStatus = state.formStatus;

            if (formStatus is SubmissionFailed) 
            {
                _showSnackBar(context, formStatus.exception.toString());
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/login_icon2.png"),
                  Expanded(child: FormWidget()),  
                ],
              ),
            ),
          ),
          ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}