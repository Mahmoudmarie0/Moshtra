import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  String? userId;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    final userEmail = FirebaseAuth.instance.currentUser!.email;
    final userQuery = await FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: userEmail)
        .get();

    if (userQuery.docs.isNotEmpty) {
      final userData = userQuery.docs[0].data();
      userId = userQuery.docs[0].id;

      setState(() {
        _nameController.text = userData['name'] ?? '';
        _addressController.text = userData['address'] ?? '';
        _phoneNumberController.text = userData['phoneNumber'] ?? '';
      });
    }
  }

  void updateUserProfile() async {
    if (userId == null) return;

    if (_nameController.text.isEmpty &&
        _addressController.text.isEmpty &&
        _phoneNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('All fields are empty. Please fill at least one field to update.'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        ),
      );
      return;
    }

    Map<String, dynamic> updatedData = {};

    if (_nameController.text.isNotEmpty) {
      if (_isNameValid(_nameController.text)) {
        updatedData['name'] = _nameController.text;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid name. Name should contain only letters.'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          ),
        );
        return;
      }
    }

    if (_addressController.text.isNotEmpty) {
      if (_isAddressValid(_addressController.text)) {
        updatedData['address'] = _addressController.text;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid address. Address should contain only letters and digits.'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          ),
        );
        return;
      }
    }

    if (_phoneNumberController.text.isNotEmpty) {
      String phoneNumber = _phoneNumberController.text;
      if (phoneNumber.length == 10 && (phoneNumber.startsWith('11') || phoneNumber.startsWith('15') || phoneNumber.startsWith('10'))) {
        updatedData['phoneNumber'] = phoneNumber;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid phone number. Phone number must start with 11, 15, or 10 and be 10 digits long.'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          ),
        );
        return;
      }
    }

    if (updatedData.isNotEmpty) {
      await FirebaseFirestore.instance.collection('Users').doc(userId).update(updatedData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Profile updated successfully'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        ),
      );
    }
  }

  bool _isNameValid(String name) {
    final RegExp nameRegExp = RegExp(r'^[a-zA-Z\s]*$'); // Allow spaces in names
    return nameRegExp.hasMatch(name);
  }

  bool _isAddressValid(String address) {
    final RegExp addressRegExp = RegExp(r'^[a-zA-Z0-9\s]*$'); // Allow spaces in addresses
    return addressRegExp.hasMatch(address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextFieldWithIcon(
                  controller: _nameController,
                  labelText: 'Name',
                  icon: Icons.person,
                  validator: (value) {
                    if (value!.isNotEmpty && !_isNameValid(value)) {
                      return 'Name should contain only letters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                _buildTextFieldWithIcon(
                  controller: _addressController,
                  labelText: 'Address',
                  icon: Icons.location_on,
                  validator: (value) {
                    if (value!.isNotEmpty && !_isAddressValid(value)) {
                      return 'Address should contain only letters and digits';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                _buildTextFieldWithIcon(
                  controller: _phoneNumberController,
                  labelText: 'Phone Number',
                  icon: Icons.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  validator: (value) {
                    if (value!.isNotEmpty && (value.length != 10 || !(value.startsWith('11') || value.startsWith('15') || value.startsWith('10')))) {
                      return 'Phone number must be 10 digits long and start with 11, 15, or 10';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: updateUserProfile,
                  child: Text(
                    'Update Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithIcon({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: Colors.teal),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
        ),
        validator: validator,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UserProfilePage(),
  ));
}