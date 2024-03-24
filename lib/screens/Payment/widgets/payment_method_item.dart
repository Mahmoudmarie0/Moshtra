
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moshtra/utils/constants/colors.dart';

class PaymentMethoditem extends StatelessWidget {
  final bool isActive;
  final String img;

  const PaymentMethoditem({
    required this.isActive, required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
          shape:    RoundedRectangleBorder(
            side:  BorderSide(
                width: 1.50,
                color:isActive? AppColors.blue:Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
      ),
      duration: const Duration(microseconds: 300),
      child:Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,

        ),
        child: Center(
          child: SvgPicture.asset(img,
          ),
        ),


      ) ,



    );
  }
}