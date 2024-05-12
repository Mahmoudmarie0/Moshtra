import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../Profile/controller/Controller.dart';
ProfileCopntroller controller = Get.put(ProfileCopntroller());

buildPrintableData(image,final dynamic total) => pw.Padding(
      padding: const pw.EdgeInsets.all(20),
      child: pw.Stack(
        children: [
          pw.Container(
            width: double.infinity,
            child: pw.Padding(
              padding:
                  const pw.EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
              child: pw.Column(
                children: [
                  pw.Text(
                    "Tax Receipt",
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      // color:  pw. Colors.black,
                      fontSize: 25,
                      // fontWeight:  FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  pw.Text(
                    "From Moshtra",
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      // color:  pw. Colors.black,
                      fontSize: 25,
                      // fontWeight:  FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  pw.Divider(
                    thickness: 2,
                    height: 60,
                  ),
                  pw.SizedBox(
                    height: 30,
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Date",
                      ),
                      pw.Spacer(),
                      pw.Text(
                          DateTime.now().toString().substring(0, 10),
                      ),
                    ],
                  ),
                  pw.SizedBox(
                    height: 20,
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Time",
                      ),
                      pw.Spacer(),
                      pw.Text(
                          DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString(),
                      ),
                    ],
                  ),
                  pw.SizedBox(
                    height: 20,
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "To",
                      ),
                      pw.Spacer(),
                      pw.Text(
                        ' ${controller.userName}',
                      ),
                    ],
                  ),
                  pw.Divider(
                    thickness: 2,
                    height: 60,
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "`shipping`",
                      ),
                      pw.Spacer(),
                      pw.Text(
                        r'$50.97',
                      ),
                    ],
                  ),
                  pw.SizedBox(
                    height: 30,
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "subtotal",
                      ),
                      pw.Spacer(),
                      pw.Text(
                        r'$50.97',
                      ),
                    ],
                  ),
                  pw.SizedBox(
                    height: 30,
                  ),
                  pw.Row(
                    children: [
                      pw.Text(
                        "Total",
                      ),
                      pw.Spacer(),
                      pw.Text(
                        total.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

//ThankYouView();
