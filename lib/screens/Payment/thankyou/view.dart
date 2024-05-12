import 'package:flutter/material.dart';
import '../widgets/ThankYouViewBody.dart';
import '../../../utils/custom_widgets/build_appbar.dart';

class ThankYouView extends StatelessWidget {
  final dynamic total;
  const ThankYouView({Key? key, required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: buildAppBar( SearchDisplay : false),
      body: ThankYouViewBody( total: total),

    );
  }
}
