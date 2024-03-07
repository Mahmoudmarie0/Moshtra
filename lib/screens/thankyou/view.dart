import 'package:flutter/material.dart';
import 'package:payment/widgets/ThankYouViewBody.dart';
import 'package:payment/widgets/build_appbar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: buildAppBar(),
      body: ThankYouViewBody(),

    );
  }
}
