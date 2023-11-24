import 'package:equatable/equatable.dart';

//olayları burada tutalım

abstract class LoginEvent extends Equatable {}

class LoginUsernameChanged extends LoginEvent {  //username textfieldındaki değişikler için

  final String? username;

  LoginUsernameChanged({this.username});

  @override
  List<Object?> get props => [username];

}

class LoginPasswordChanged extends LoginEvent {

  final String? password;

  LoginPasswordChanged({this.password});

  @override
  List<Object?> get props => [password];

}

class LoginSubmitted extends LoginEvent {
  @override
  
  List<Object?> get props => [];

}