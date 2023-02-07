import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:openbank/models/user_models.dart';

class FirestoreHelper {
  static readOnlyOneCollection() {
    final db = FirebaseFirestore.instance;
    final currentUser = FirebaseAuth.instance;

    final docRef = db.collection("user").doc(currentUser.currentUser!.uid);
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        return data;
      },
    );
  }

  static Stream<List<UserModel>> read() {
    final userCollection = FirebaseFirestore.instance.collection('user');

    return userCollection.snapshots().map(
          (querySnapshot) =>
              querySnapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList(),
        );
  }

  static Future create(UserModel user) async {
    final userCollection = FirebaseFirestore.instance.collection('user');
    final uid = userCollection.doc().id;
    final docRef = userCollection.doc(uid);

    final newUser = UserModel(
      id: uid,
      name: user.name,
      email: user.email,
      data: user.data,
      cpf: user.cpf,
      imgProfile: user.imgProfile,
    ).toJson();

    try {
      await docRef.set(newUser);
    } catch (e) {}
  }

  static Future update(UserModel user) async {
    final userCollection = FirebaseFirestore.instance.collection('user');
    final docRef = userCollection.doc(user.id);

    final newUser = UserModel(
      name: user.name,
      id: user.id,
      email: user.email,
      cpf: user.cpf,
      data: user.data,
      imgProfile: user.imgProfile,
    ).toJson();

    try {
      await docRef.update(newUser);
    } catch (e) {}
  }

  static Future delete(UserModel user) async {
    final userCollection = FirebaseFirestore.instance.collection('user');
    final docRef = userCollection.doc(user.id).delete();
    return docRef;
  }
}
