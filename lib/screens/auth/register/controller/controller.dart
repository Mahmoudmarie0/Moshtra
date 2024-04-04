import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/components.dart';
import '../../../Home_layout/view.dart';




class RegisterController extends GetxController{
  bool oobscureText=true;

  Position? position;
  List<Placemark>? placemarks;
  var formKey = GlobalKey<FormState>();

  void ontap(){
    oobscureText=!oobscureText;
    update();
  }

  void buttonFunction()
  {
    if(formKey.currentState!.validate()) {
      //  Get.offAll(() => OnBoarding());
    }
  }

  void validateRegisterCredentials(String name, String email,String phoneNumber,String password) {
    if(name.isEmpty||email.isEmpty || phoneNumber.isEmpty || password.isEmpty)
      GetSnackbarError( message: 'Please fill in all fields ',Color: AppColors.Red);

    else if(phoneNumber.length!=10){
      GetSnackbarError( message: "Enter correct phone number",Color: AppColors.Red);

    }
    else {

      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) => {
        print("Register Succes"),
        print(value.user!.email),
        print(value.user!.uid),
      GetSnackbarError( message: 'Your account has been created successfully ',Color: AppColors.Green),
      Get.to(HomeLayout(),transition:  Transition.leftToRight),


      })
          .catchError((error){
            if(error is FirebaseAuthException && error.code=='invalid-email')
        GetSnackbarError( message: "The email address is badly formatted.",Color: AppColors.Red);

            else if(error is FirebaseAuthException && error.code=='weak-password')
              GetSnackbarError( message: "Password should be at least 6 characters ",Color: AppColors.Red);

        else if(error is FirebaseAuthException && error.code=='email-already-in-use')
        GetSnackbarError( message: "The email address is already in use ",Color: AppColors.Red);
            print(error.toString());



      });

      // Perform login or other actions
    }
  }

  onChange(bool value){
    //  isChecked=!value;
    update();
  }





  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      GetSnackbarError( message: "Location services are disabled. Please enable it",Color: AppColors.Red);
      return false;

    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        GetSnackbarError( message: " Location permissions are denied",Color: AppColors.Red);
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      GetSnackbarError( message: "Location permissions are permanently denied",Color: AppColors.Red);
      return false;

    }
    return true;
  }



  Future<String>getCurrentLocation() async
  {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return '';
    Position newPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );
    position = newPosition;

    placemarks = await placemarkFromCoordinates(
      position!.latitude,
      position!.longitude,
    );
    Placemark pMark = placemarks![0];
    String completeAddress = '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea} ${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country}';
    // String completeAddress = '${pMark.street}, ${pMark.subLocality}, ${pMark.subAdministrativeArea} ${pMark.administrativeArea}, ${pMark.country}';
    return completeAddress;
  }










}