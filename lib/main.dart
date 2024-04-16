



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:moshtra/firebase_options.dart';
import 'package:moshtra/screens/splash/view.dart';
import 'package:moshtra/service/home_service.dart';
import 'package:moshtra/service/stripe_payment/stripe_Keys.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global_controller/my_bindings.dart';

SharedPreferences ? sharedPref;
void main() async {

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(desktop: 800, tablet: 450, watch: 200),);


//commect


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  //await FirebaseNotification().initNotification();
  runApp( MyApp());
  sharedPref=await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //DioHelper.init();
  Stripe.publishableKey=ApiKeys.publishableKey;
}

class MyApp extends StatelessWidget {

  //const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return GetMaterialApp(
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
        );
      },
      child: SplashScreen(),
    );

  }
}


