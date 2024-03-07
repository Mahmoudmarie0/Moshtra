import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment/widgets/total_price.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({Key? key}) : super(key: key);

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
              )
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50+16,
                left: 22,
                right: 22
              ),
              child: Column(
                children: [
                  const Text("Thank You!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Text("Your transaction was successful",
                  textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.800000011520929),
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter',
                      height: 0
                    ),
                  ),
                  const SizedBox(height: 42,),
                  const paymentItemInfo(title:'Date' ,value: '01/24/2023',),
                  const SizedBox(height: 20,),
                  const paymentItemInfo(title: 'Time',value:'10:15 AM' ,),
                  const SizedBox(height: 20,),
                  const paymentItemInfo(title: 'To',value: 'Sam Louis',),

                  const Divider(thickness: 2,height: 60,),
                  Total_price(price: r'$50.97'),
                  SizedBox(height: 30,),
                  Container(
                    width: 305,
                    padding: EdgeInsets.symmetric(vertical: 16,horizontal: 22),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )

                    ),
                    child: Row(
                      children: [
                        Image(image: AssetImage('assets/images/logo.png')),
                        SizedBox(width: 23,),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(

                                text: 'Credit Card',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),

                              TextSpan(
                                text: 'Mastercard **78 ',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.69999998807971),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  height: 0,
                                  fontFamily: 'Inter',

                                ),
                              ),
                            ],
                          ),
                        )
                        

                      ],


                    ),

                  ),
                Spacer(),
                Row(
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
                                )
                              ),
                            child: Center(
                              child: Text('PAID',
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
                  SizedBox(
                    height: ((MediaQuery.sizeOf(context).height*.2+20)/2)-29,
                    ),
                ],
              ),
            ),
          ),

          Positioned(
              bottom: MediaQuery.sizeOf(context).height*.2+20,
              left: 36,
              right: 36,

              child: Row(
            children: List.generate(30, (index) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  color:const Color(0XFFB8B8B8),
                  height: 2,

                ),
              ),
            )),


          )),
          Positioned(
            left: -20,
              bottom: MediaQuery.sizeOf(context).height*.2,
              child: const CircleAvatar(
                backgroundColor: Colors.white,

              )),
          Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height*.2,
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
            child:CircleAvatar(
                 radius: 27,
                  backgroundColor: Color(0XFF34A853),
              child: Icon(
                Icons.check,
                size: 50,
              ),
    ),

          ))


        ],
      ),
    ) ;
  }
}
class paymentItemInfo extends StatelessWidget {
  const paymentItemInfo({Key? key, required this.title, required this.value}) : super(key: key);
final String title,value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
        textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
            height: 0,
          ),
        ),
        Text(value,
          textAlign: TextAlign.center,
          style: const TextStyle(
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

