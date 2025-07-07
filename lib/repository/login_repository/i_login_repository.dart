import '../../models/user/user_model.dart';

abstract class ILoginRepository{
  Future<UserModel> loginWithCpfAndPassword({
    required String cpf,
    required String password,
  });

  Future<UserModel> register({
    required String name,
    required String email,
    required String cpf,
    required String password,
  });

  Future<void> logout();

  Future<UserModel?> getCurrentUser();
}