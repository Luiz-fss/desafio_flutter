

import 'package:desafio_flutter/view-models/login_cubit/login_cubit_actions.dart';
import 'package:desafio_flutter/view-models/login_cubit/login_cubit_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginCubitModel> implements LoginCubitActions{
  LoginCubit() : super(LoginCubitModel(
    rememberMe: false,
    isLogin: true
  ));

  @override
  void setIsLogin(bool value) {
    emit(state.copyWith(isLogin: value));
  }

  @override
  void toggleRememberMe() {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }
}