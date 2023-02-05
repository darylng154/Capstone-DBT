import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/login/login.dart';
import 'package:formz/formz.dart';
import 'package:flutter_login/button/nav.dart';

double _textFontSize = 12;
int _textMaxLines = 1;

String _emailStr = "Email:";
String _passwordStr = "Password:";
double _navButtonWidth = 0.4;

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  // shows a SnackBar if the login submission fails
  @override
  Widget build(BuildContext context)
  {
    return BlocListener<LoginBloc, LoginState>
    (
      listener: (context, state)
      {
        if (state.status.isSubmissionFailure)
        {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar
            (
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align
      (
        alignment: const Alignment(0, -1 / 3),
        child: Column
        (
          mainAxisSize: MainAxisSize.min,
          children:
          [
            // _UsernameRow(),
            _UsernameInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _PasswordInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _LoginButton(),
            const Padding(padding: EdgeInsets.all(12)),
            _AccountButton(),
          ],
        ),
      ),
    );
  }

  Widget _UsernameRow() // breaks the page
  {
    return Expanded
    (
      child: Row
      (
        children: [_textName(_emailStr), _UsernameInput(),],
      ),
    );
  }

  // duplicate due to import TextFunc.dart error
  Widget _textName(String field)
  {
    // return printAutoSizeText(field, textFontSize, false, textMaxLines);
    return AutoSizeText
      (
      field,
      style: TextStyle
        (
        color: Colors.black,
        fontSize: _textFontSize,
        fontWeight: FontWeight.normal,
      ),
      maxLines: _textMaxLines,
    );
  }
}

// notifies the LoginBloc of changes to username/email
class _UsernameInput extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocBuilder<LoginBloc, LoginState>
    (
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state)
      {
        return TextField
        (
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration
          (
            labelText: 'username',
            errorText: state.username.invalid ? 'invalid username' : null,
          ),
        );
      },
    );
  }
}

// notifies the LoginBloc of changes to password
class _PasswordInput extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocBuilder<LoginBloc, LoginState>
    (
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state)
      {
        return TextField
        (
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration
          (
            labelText: 'password',
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocBuilder<LoginBloc, LoginState>
    (
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state)
      {
        return state.status.isSubmissionInProgress
          ? const CircularProgressIndicator()
          : ElevatedButton
            (
              key: const Key('loginForm_continue_raisedButton'),
              onPressed: state.status.isValidated ? ()
              {
                context.read<LoginBloc>().add(LoginSubmitted(context));
              }
              : null,
            child: const Text('Login'),
            );
      },
    );
  }
}

class _AccountButton extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocBuilder<LoginBloc, LoginState>
    (
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state)
      {
        return Nav('/account', 'Open New Account', width: _navButtonWidth);
      },
    );
  }
}