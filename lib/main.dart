



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:moshtra/firebase_options.dart';
import 'package:moshtra/screens/splash/view.dart';
import 'package:moshtra/service/home_service.dart';
import 'package:moshtra/service/stripe_payment/stripe_Keys.dart';
import 'package:moshtra/utils/constants/localizations.dart';
import 'package:moshtra/utils/translation/translation.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global_controller/my_bindings.dart';

SharedPreferences ? sharedPref;
void main() async {

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(desktop: 800, tablet: 450, watch: 200),);


//s;d;lkkd


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
          defaultTransition: Transition.leftToRight,
          title: 'Moshtra',
          theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            fontFamily: "IBMPlex",
          ),
          builder: EasyLoading.init(),
          locale: const Locale("en", "US"),
          translations: AppTranslation(),
          supportedLocales: supportedLocales,
          localizationsDelegates: localizationsDelegate,
          localeResolutionCallback: localeResolutionCallback,

          home:Directionality(
            textDirection: Get.locale?.languageCode=="en"?TextDirection.ltr:TextDirection.rtl,
            child:  child!,
          )
        );
      },
      child: SplashScreen(),
    );

  }
}


