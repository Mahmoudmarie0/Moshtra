import 'package:cloud_firestore/cloud_firestore.dart';

class User_Model {
  final String name, phoneNumber, email, address;

  User_Model(this.name, this.phoneNumber, this.email, this.address);

  User_Model.fromsnapshot(QueryDocumentSnapshot<Map<String,dynamic>>snapshot)
      :name = snapshot['name'],
        email= snapshot['email'],
        phoneNumber = snapshot['phoneNumber'],
        address = snapshot['address'];


  toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }
}