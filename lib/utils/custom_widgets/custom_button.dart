import 'package:flutter/cupertino.dart';

import '../styles.dart';

class CustomButton extends StatelessWidget {
   final void Function()? onTap;
   final String txt;
  const CustomButton({
    this.onTap, required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,



      child: Container(
        width: double.infinity,
        height: 73,
        decoration: ShapeDecoration(
          color: Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: Text(
            txt,
            textAlign: TextAlign.center,
            style: Styles.style22,
          ),
      
      
      
      
      
        ),
      ),
    );
  }
}