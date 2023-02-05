part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable
{
  const LoginEvent();

  @override
  List<Object> get props => [];
}

// notifies the bloc that the username has been modified
class LoginUsernameChanged extends LoginEvent
{
  const LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

// notifies the bloc that the password has been modified.
class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

// notifies the bloc that the form has been submitted.
class LoginSubmitted extends LoginEvent {
  LoginSubmitted(this.context);

  final BuildContext context;

  List<Object> get props => [context];
}