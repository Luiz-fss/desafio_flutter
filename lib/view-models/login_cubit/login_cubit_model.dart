

class LoginCubitModel {
  final bool rememberMe;
  final bool isLogin;

  LoginCubitModel(
      {this.isLogin = true,this.rememberMe=false});

  LoginCubitModel copyWith({bool? rememberMe,bool? isLogin}) => LoginCubitModel(
    isLogin: isLogin ?? this.isLogin,
    rememberMe: rememberMe ?? this.rememberMe,
  );
}