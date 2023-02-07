import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? cpf;
  final String? data;
  final String? imgProfile;

  UserModel(
      {this.cpf, this.data, this.imgProfile, this.id, this.name, this.email});

  factory UserModel.fromSnapshot(DocumentSnapshot snapshop) {
    var snapshot = snapshop.data() as Map<String, dynamic>;
    return UserModel(
      id: snapshot['id'],
      name: snapshot['name'],
      email: snapshot['email'],
      cpf: snapshot['cpf'],
      data: snapshot['data'],
      imgProfile: snapshot['imgProfile'],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "cpf": cpf,
        "data": data,
        "imgProfile": imgProfile,
      };
}
