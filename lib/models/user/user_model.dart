import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? cpf;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.cpf,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      cpf: json['cpf'],
    );
  }

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return UserModel(
      id: doc.id,
      name: data['nome'] ?? '',
      email: data['email'] ?? '',
      cpf: data['cpf'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': id,
      'name': name,
      'email': email,
      'cpf': cpf,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      cpf: map['cpf'] ?? '',
    );
  }



}