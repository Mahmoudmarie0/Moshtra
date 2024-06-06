import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../login/controller/controller.dart';
import 'controller/controller.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //const RegisterScreen({super.key});
  RegisterController registerController = Get.put(RegisterController());

  bool isChecked = false;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController PasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    TextEditingController AddressController = TextEditingController();

    GlobalKey<FormState> formKey = GlobalKey();
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        //resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.blue,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: Get.locale?.languageCode == "en"
                        ? const EdgeInsets.only(left: 26, top: 112)
                        : const EdgeInsets.only(right: 50, top: 112),
                    child: Text(
                      "Register".tr,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize:
                              Get.locale?.languageCode == "en" ? 48.sp : 30.sp,
                          color: AppColors.white),
                    ),
                  ),
                  Expanded(
                    child: Get.locale?.languageCode == "en"
                        ? SvgPicture.asset(
                            AssetsPaths.Ellipse,
                          )
                        : SizedBox(),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 225),
                child: Container(
                  // height: 565.h,
                  // width: 375.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.r),
                        bottomLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r)),
                    color: AppColors.white,
                  ),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 27, right: 27, top: 70),
                      child: Container(
                        // width: 320.w,
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                  validator: (data) {
                                    if (data!.isEmpty) return 'Name is required';
                                  },
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.person),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.blue, width: 2.0),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    border: OutlineInputBorder(),
                                    labelText: 'Name'.tr,
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(15),
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[a-zA-Z]')),
                                  ]), //name
                              SizedBox(
                                height: 20.h,
                              ),
                              TextFormField(
                                  validator: (data) {
                                    if (data!.isEmpty) return 'Email is required';
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.email),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.blue, width: 2.0),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(),
                                    labelText: 'Email'.tr,
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(50),
                                  ]), //email
                              SizedBox(
                                height: 20.h,
                              ),
                              TextFormField(
                                  validator: (data) {
                                    if (data!.isEmpty)
                                      return 'Address is required';
                                  },
                                  keyboardType: TextInputType.streetAddress,
                                  controller: AddressController,
                                  decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                        onTap: () async {
                                          AddressController.text =
                                              await registerController
                                                  .getCurrentLocation();
                                        },
                                        child: Icon(Icons.location_on,color: Colors.blueAccent,)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.blue, width: 2.0),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(),
                                    labelText: 'Address'.tr,
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(50),
                                  ]
                              ), //address
                              SizedBox(
                                height: 20.h,
                              ),
                              TextFormField(
                                  validator: (data) {
                                    if (data!.isEmpty)
                                      return 'mobile is required';
                                    else if (data!.length < 10)
                                      return 'Invalid Phone number';
                                    else if (data[0] != '1')
                                      return 'Invalid Phone number';
                                    else if (data[1] != '0' &&
                                        data[1] != '1' &&
                                        data[1] != '2' &&
                                        data[1] != '5')
                                      return 'Invalid Phone number';
                                  },
                                  keyboardType: TextInputType.phone,
                                  controller: phoneNumberController,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.phone),
                                    prefixText: '+20',
                                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(),
                                    labelText: 'Phone Number'.tr,

                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.blue, width: 2.0),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ]), //phone number
                              SizedBox(
                                height: 20.h,
                              ),
                              GetBuilder<LoginController>(
                                init: LoginController(),
                                builder: (controller) => TextFormField(
                                  validator: (data) {
                                    if (data!.isEmpty ||
                                        data!.length < 8 ||
                                        !data.contains(RegExp(r'[a-zA-Z]')))
                                      return 'weak password';
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: PasswordController,
                                  decoration: InputDecoration(
                                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        controller.ontap();
                                      },
                                      child: Icon(controller.oobscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off_outlined),
                                    ),
                                    border: OutlineInputBorder(),
                                    labelText: 'Password'.tr,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.blue, width: 2.0),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(50),
                                  ],
                                  obscureText: controller.oobscureText,
                                ),
                              ), //password_1

                              SizedBox(
                                height: 20.h,
                              ),
                              GetBuilder<LoginController>(
                                init: LoginController(),
                                builder: (controller) => TextFormField(
                                  validator: (data) {
                                    if (data!.isEmpty ||
                                        data!.length < 8 ||
                                        !data.contains(RegExp(r'[a-zA-Z]')))
                                      return 'weak password';
                                    else if (data != PasswordController.text)
                                      return 'not correct';
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: confirmPasswordController,
                                  decoration: InputDecoration(
                                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        controller.ontap();
                                      },
                                      child: Icon(controller.oobscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off_outlined),
                                    ),
                                    border: OutlineInputBorder(),
                                    labelText: 'Confirm Password'.tr,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.blue, width: 2.0),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(50),
                                  ],
                                  obscureText: controller.oobscureText,
                                ),
                              ), //password_1
                              SizedBox(
                                height: 10.h,
                              ), //password_2
                              SizedBox(
                                height: 18.h,
                              ),
                              Container(
                                width: 319.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.r),
                                  color: AppColors.orange,
                                ),
                                child: MaterialButton(
                                    onPressed: () {
                                      String name = nameController.text;
                                      String email = emailController.text;
                                      String phoneNumber =
                                          phoneNumberController.text;
                                      String Password =
                                          PasswordController.text;
                                      String confirmPassword =
                                          confirmPasswordController.text;

                                      String address = AddressController.text;

                                      if (formKey.currentState!.validate()) {
                                        isLoading = true;
                                        // setState(() {
                                        // });
                                        registerController
                                            .validateRegisterCredentials(
                                                name,
                                                email,
                                                phoneNumber,
                                                Password,
                                                address);
                                        registerController.addUser(
                                            name, email, phoneNumber, address);
                                        isLoading = false;
                                        // setState(() {
                                        // });
                                      } else {}
                                    },
                                    child: Text(
                                      "Register".tr,
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.sp,
                                      ),
                                    )),
                              ), //Register Button
                              SizedBox(
                                height: 57.h,
                              ),
                            ],
                          ),
                        ),
                      )), //form
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
