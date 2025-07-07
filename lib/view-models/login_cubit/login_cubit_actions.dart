
abstract class LoginCubitActions {

  void toggleRememberMe();
  void setIsLogin(bool value);
  Future<void> registerUser(String cpf, String name, String pass,String email);
  Future<void> signOut();
  Future<void> login(String cpf, String pass);
}