

import 'package:desafio_flutter/repository/login_repository/i_login_repository.dart';
import 'package:desafio_flutter/repository/login_repository/login_repository.dart';
import 'package:desafio_flutter/view-models/login_cubit/login_cubit_actions.dart';
import 'package:desafio_flutter/view-models/login_cubit/login_cubit_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user/user_model.dart';

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

  @override
  Future<void> registerUser(String cpf, String name, String pass,String email) async{
    final formattedCpf = cpf.replaceAll(RegExp(r'[.-]'), '');
    LoginRepository loginRepository = LoginRepository();
    UserModel user = await loginRepository.register(
      name: name,
      email: email,
      cpf: formattedCpf,
      password: pass,
    );
    emit(state.copyWith(userLogged:user));

  }

  @override
  Future<void> signOut()async {
    LoginRepository loginRepository = LoginRepository();
    await loginRepository.logout();
    emit(state.copyWith(userLogged: null));
  }

  @override
  Future<void> login(String cpf, String pass) async{
    try {
      final formattedCpf = cpf.replaceAll(RegExp(r'[.-]'), '');
      LoginRepository loginRepository = LoginRepository();
      UserModel user = await loginRepository.loginWithCpfAndPassword(
        cpf: formattedCpf,
        password: pass,
      );

      emit(state.copyWith(userLogged: user));
    } catch (e) {
      throw Exception("Erro ao fazer login: ${e.toString()}");
    }
  }
}