import 'package:equatable/equatable.dart';
import 'package:login_screen_with_bloc/auth/form_submission_status.dart';

class LoginState extends Equatable{

  final String username;
  bool get isValidUsername => username.length > 3; // 3 karakterden fazla olsun

  final String password;
  bool get isValidPassword => password.length > 6; 

  final FormSubmissionStatus formStatus; //username ve passworde göre değişecek durum olan FormSubmissionStatus

  const LoginState({
    this.username = "", this.password = "", this.formStatus = const InitialFormStatus() //username ve password ilk halde boş, form status de ilk halde normal durumunda
  });

  LoginState copyWrite(
    {String? username, String? password, FormSubmissionStatus? formStatus})
  {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  
  List<Object?> get props => [username,password,formStatus];

}