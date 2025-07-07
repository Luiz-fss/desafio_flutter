import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_flutter/models/user/user_model.dart';
import 'package:desafio_flutter/repository/login_repository/i_login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository extends ILoginRepository {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  @override
  Future<UserModel?> getCurrentUser() async {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> loginWithCpfAndPassword(
      {required String cpf, required String password}) async {
    try {

      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .where('cpf', isEqualTo: cpf)
          .get();

      if (snapshot.docs.isEmpty) {
        throw Exception('Usuário não encontrado com este CPF.');
      }

      Map<String, dynamic> userData =
      snapshot.docs.first.data() as Map<String, dynamic>;

      String email = userData['email'];

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return UserModel.fromMap(userData);
    } on FirebaseAuthException catch (e) {
      throw Exception('Erro ao fazer login: ${e.message}');
    } catch (e) {
      throw Exception('Erro inesperado: ${e.toString()}');
    }
  }

  @override
  Future<void> logout() async{
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String cpf,
    required String password,
  }) async {
    try {

      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user?.uid;
      if (uid == null) {
        throw Exception("Falha ao obter UID do usuário.");
      }

      final userModel = UserModel(
        id: uid,
        name: name,
        email: email,
        cpf: cpf,
      );
      await _firestore
          .collection("users")
          .doc(uid)
          .set(userModel.toMap());

      return userModel;
    } on FirebaseAuthException catch (e) {
      throw Exception("Erro ao registrar usuário: ${e.message}");
    } catch (e) {
      throw Exception("Erro inesperado: $e");
    }
  }
}
