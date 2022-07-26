import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String profilPhoto;
  String email;
  String uid;

  User(
      {required this.name,
      required this.profilPhoto,
      required this.email,
      required this.uid});

  //지도
  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePhoto": profilPhoto,
        "email": email,
        "uid": uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot['email'],
      profilPhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      name: snapshot['name'],
    );
  }
}
