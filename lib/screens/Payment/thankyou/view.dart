import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../widgets/ThankYouViewBody.dart';
import '../../../utils/custom_widgets/build_appbar.dart';

class ThankYouView extends StatelessWidget {
  final dynamic total;
  final dynamic subtotal;
  const ThankYouView({Key? key, required this.total,  required this.subtotal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: AppColors.white,
      appBar: buildAppBar( SearchDisplay : false),
      body: ThankYouViewBody( total: total , subtotal: subtotal),

    );
  }
}
