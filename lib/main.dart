import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:moshtra/firebase_options.dart';
import 'package:moshtra/global_controller/my_bindings.dart';
import 'package:moshtra/screens/Categories/Electronic/electronics.dart';
import 'package:moshtra/screens/checkout/OrderSuccess.dart';
import 'package:moshtra/screens/splash/view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Dio/DioHelper.dart';

//test
//test1
SharedPreferences ? sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( MyApp());
  sharedPref=await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  DioHelper.init();
}
//main
class MyApp extends StatelessWidget {

  //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.03);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
          child: GetMaterialApp(
            initialBinding: MyBindings(),
            debugShowCheckedModeBanner: false,
            title: 'Moshtra',
            theme: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              fontFamily: "IBMPlex",
            ),
            builder: EasyLoading.init(),

            home: child!,
          ),
        );
      },
      child: SplashScreen(),
    );

  }
}
//hiiii

