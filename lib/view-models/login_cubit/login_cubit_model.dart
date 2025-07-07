

import 'package:desafio_flutter/models/user/user_model.dart';

class LoginCubitModel {
  final bool rememberMe;
  final bool isLogin;
  final UserModel? userLogged;

  LoginCubitModel(
      {this.isLogin = true,this.rememberMe=false,this.userLogged});

  LoginCubitModel copyWith({bool? rememberMe,bool? isLogin,UserModel? userLogged}) => LoginCubitModel(
    isLogin: isLogin ?? this.isLogin,
    rememberMe: rememberMe ?? this.rememberMe,
    userLogged: userLogged ?? this.userLogged
  );
}