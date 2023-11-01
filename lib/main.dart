import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:moshtra/screens/splash/view.dart';
import 'package:shared_preferences/shared_preferences.dart';


SharedPreferences ? sharedPref;
void main() async {
  runApp(const MyApp());
  sharedPref=await SharedPreferences.getInstance();
}
//main
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.03);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Moshtra',
            theme: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              fontFamily: "IBMPlex",
            ),
            home: child!,
          ),
        );
      },
      child: SplashScreen(),
    );

  }
}


