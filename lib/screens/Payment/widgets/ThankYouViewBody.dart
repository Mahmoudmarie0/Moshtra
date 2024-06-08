
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moshtra/screens/Payment/widgets/total_price.dart';
import 'package:printing/printing.dart';
import '../../../utils/constants/colors.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import '../../Profile/controller/Controller.dart';
import '../thankyou/printable_data.dart';


class ThankYouViewBody extends StatelessWidget {
  final dynamic total;
final dynamic subtotal;
  ThankYouViewBody({
    Key? key,
    required this.total,
    required this.subtotal
  }) : super(key: key);
  ProfileCopntroller controller = Get.put(ProfileCopntroller());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
                color: const Color(0XFFEDEDED),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
            child: Padding(
              padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
              child: Column(
                children: [
                  const Text(
                    "Thank You!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Text(
                    "Your transaction was successful".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.800000011520929),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                        height: 0),
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  paymentItemInfo(
                    title: 'Date'.tr,
                    value: DateTime.now().toString().substring(0, 10),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  paymentItemInfo(
                    title: 'Time'.tr,
                    value: DateTime.now().hour.toString() +
                        ":" +
                        DateTime.now().minute.toString(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  paymentItemInfo(
                    title: 'To'.tr,
                    value: ' ${controller.userName}',
                  ),
                  const Divider(
                    thickness: 2,
                    height: 60,
                  ),
                  Total_price(price: total.toString() + " EGP"),
                  // SizedBox(
                  //   height: 30,
                  // ),

                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage('assets/images/Vector.png')),
                        Container(
                          width: 113,
                          height: 58,
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.50,
                              color: Color(0XFF34A853),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          )),
                          child: Center(
                            child: Text(
                              'PAID'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0XFF34A853),
                                fontFamily: 'Inter',
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: ElevatedButton(
                      clipBehavior: Clip.none,
                      autofocus: false,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppColors.white),
                      ),
                      onPressed: () => printDoc(total,subtotal),
                      child: Text(
                        'Save as PDF'.tr,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: MediaQuery.sizeOf(context).height * .2 + 20,
              left: 36,
              right: 36,
              child: Row(
                children: List.generate(
                    30,
                    (index) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Container(
                              color: const Color(0XFFB8B8B8),
                              height: 2,
                            ),
                          ),
                        )),
              )),
          Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          const Positioned(
              top: -20,
              left: 0,
              right: 0,
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Color(0XFFD9D9D9),
                child: CircleAvatar(
                  radius: 27,
                  backgroundColor: Color(0XFF34A853),
                  child: Icon(
                    Icons.check,
                    size: 50,
                  ),
                ),
              )),
          // Positioned(
          //   top: 450,
          //   left: 0,
          //   right: 0,
          //   child: buttonWidget(
          //     color: AppColors.black,
          //     text: 'Save as PDF',
          //     width: 13.0,
          //     height: 12,
          //     radius: 12,
          //     onPress: () => printDoc(total ),
          //     fontWeight: FontWeight.w500,
          //     fontSize: 12,
          //     conColor: AppColors.white,
          //   ),
          // )
        ],
      ),
    );
  }
}

class paymentItemInfo extends StatelessWidget {
  const paymentItemInfo({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
            height: 0,
          ),
        ),
        Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
            height: 0,
          ),
        )
      ],
    );
  }
}

Future<void> printDoc(final dynamic total,final dynamic subtotal) async {
  final doc = pw.Document();
  final image = await imageFromAssetBundle('assets/images/Vector.png');
  doc.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return buildPrintableData(image, total,subtotal);
      }));
  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => doc.save());
}
