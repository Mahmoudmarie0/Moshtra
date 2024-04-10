import 'package:cloud_firestore/cloud_firestore.dart';

class User_Model {
  final String name, phoneNumber, email, address;

  User_Model(this.name, this.phoneNumber, this.email, this.address);

  User_Model.fromJson(QueryDocumentSnapshot<Map<String,dynamic>>snapshot)
      :name = snapshot['name'],
        email= snapshot['email'],
        phoneNumber = snapshot['phoneNumber'],
        address = snapshot['address'];

}