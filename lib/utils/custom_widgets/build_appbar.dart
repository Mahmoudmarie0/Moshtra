import 'package:flutter/material.dart';

import '../styles.dart';

AppBar buildAppBar( { final String? title}) {
  return AppBar(
    leading: Icon(Icons.arrow_back_ios_new_outlined),

    title:   Text(
      title??'',
      textAlign: TextAlign.center,
      style: Styles.style25,

    ),
//mahmoud



  );
}