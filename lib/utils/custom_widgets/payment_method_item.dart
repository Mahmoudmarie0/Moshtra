import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                color:isActive?const Color(0xFF34A853):Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: [
            BoxShadow(
              color: isActive?const Color(0xFF34A853):Colors.white,
              blurRadius: 4,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
          ]

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