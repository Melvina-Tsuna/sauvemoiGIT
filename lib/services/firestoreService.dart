import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sauve_moi/models/user.dart';

class FirestoreService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection("users");

  Future createUser(Users users) async {
    try {
      await _collectionReference.doc(users.idUser).set(users.toJson());
    } catch (e) {
      return e.toString();
    }
  }
}
