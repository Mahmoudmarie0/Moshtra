import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:moshtra/firebase_options.dart';
import 'package:moshtra/screens/splash/view.dart';
import 'package:moshtra/service/paypal_payment/view.dart';
import 'package:moshtra/service/stripe_payment/stripe_Keys.dart';
import 'package:moshtra/utils/constants/localizations.dart';
import 'package:moshtra/utils/translation/translation.dart';
import 'package:paymob_payment/paymob_payment.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global_controller/my_bindings.dart';

SharedPreferences? sharedPref;
void main() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(desktop: 800, tablet: 450, watch: 200),
  );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await FirebaseNotification().initNotification();
  runApp(MyApp());
  sharedPref = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Stripe.publishableKey = ApiKeys.publishableKey;
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // integrationID: 4575911,
    // iFrameID: 846387,
    apiKey:// "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2libUZ0WlNJNkltbHVhWFJwWVd3aUxDSndjbTltYVd4bFgzQnJJam8yT1RBMk56VjkuX3lZTklHVGkwVXBLTmVzdjh0Q0dxc0ZlTmVkNnJobGFid2RoUXlJNFFuMlBUZ2k1Q3VyaGFxbmt2SGlrbXo1enBzaUdxYmhiU0pDU3VCTzA4bGxpcFE=",
    PaymobPayment.instance.initialize(
      apiKey: "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RjMk5URXlMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuS2pXUjRUU1BjVXVTT3BRUzdnZlpmelU0RnJBX1RnSERPYjI5SmZ0UVR5XzRmUU51SVNtbVVMTXB3UXU0VjFoT0k2MW1ZQjIyM3hTYkhlRlI5RjdTMWc=",
      integrationID: 4575911,
      iFrameID: 846387,
    );
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
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
            home: Directionality(
              textDirection: Get.locale?.languageCode == "en"
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: child!,
            ));
      },
      child:  SplashScreen(),
    );
  }
}
