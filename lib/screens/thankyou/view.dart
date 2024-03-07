import 'package:flutter/material.dart';

import '../../utils/custom_widgets/ThankYouViewBody.dart';
import '../../utils/custom_widgets/build_appbar.dart';


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
