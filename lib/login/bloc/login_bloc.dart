// import 'package:authentication_repository/authentication_repository.dart';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login/login/login.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

String _shipperEmail = "shipper@toprunapp.com";
String _transporterEmail = "transporter@toprunapp.com";
String _dispatcherEmail = "dispatcher@toprunapp.com";
String _employeeEmail = "employee@toprunapp.com";

String _password = "password";

class LoginBloc extends Bloc<LoginEvent, LoginState>
{
  // LoginBloc({
  //   required AuthenticationRepository authenticationRepository,
  // })  : _authenticationRepository = authenticationRepository,
  //       super(const LoginState()) {

  LoginBloc():super(const LoginState())
  {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  // final AuthenticationRepository _authenticationRepository;
  int _numTries = 3;
  int _count = 0;

  void _onUsernameChanged(LoginUsernameChanged event, Emitter<LoginState> emit)
  {
    final username = Username.dirty(event.username);
    emit
    (
      state.copyWith
      (
        username: username,
        status: Formz.validate([state.password, username]),
      ),
    );
  }

  // w/e password changes, bloc creates password model and updates the form
  // status with Formz.validate API
  void _onPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit)
  {
    final password = Password.dirty(event.password);
    emit
    (
      state.copyWith
      (
        password: password,
        status: Formz.validate([password, state.username]),
      ),
    );
  }

  // if the current status of the form is valid, bloc makes a call to login
  Future<void> _onSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async
  {
    if (state.status.isValidated)
    {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try
      {
        // this is where we would use login function
        // await _authenticationRepository.logIn(
        //   username: state.username.value,
        //   password: state.password.value,
        // );

        // print('inside login bloc: username: ${state.username.value}\tpassword: ${state.password.value}\n');

        if(state.username.value == _shipperEmail && state.password.value == _password)
        {
          Navigator.pushNamed(event.context, '/shipper');
        }
        else if(state.username.value == _transporterEmail && state.password.value == _password)
        {
          print("login success");
          Navigator.pushNamed(event.context, '/transporter');
        }
        else if(state.username.value == _dispatcherEmail && state.password.value == _password)
        {
          Navigator.pushNamed(event.context, '/dispatcher');
        }
        else if(state.username.value == _employeeEmail && state.password.value == _password)
        {
          Navigator.pushNamed(event.context, '/employee');
        }
        else
        {
          if (_count >= _numTries)
            exit(0);
          else
            _count++;
        }

        // put Controller's BOHasData call into BlocBuilder
        // final Username username;
        // final Password password;
        // context.read<BOBloc>().add(OnQueryJobs(''));
        // BlocBuilder<BOBloc, BOState>
        // (
        //   builder: (context, state)
        //   {
        //     if(state is BOHasData && json.decode(state.result) != null)
        //     {
        //       for(var res in json.decode(state.result)['jobs'])
        //       {
        //         username = res['username'];
        //         password = res['password'];
        //       }
        //           context.read<LoginBloc>().add(LoginUsernameChanged(username));
        //           context.read<LoginBloc>().add(LoginPasswordChanged(password));
        //     }
        //   },
        // );

        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      }
      catch (_)
      {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}