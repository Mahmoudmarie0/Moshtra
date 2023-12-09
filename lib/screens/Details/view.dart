import 'package:flutter/material.dart';
import 'package:moshtra/models/products_model.dart';
import 'package:moshtra/utils/custom_text/view.dart';

import 'controller/controller.dart';

class DetailsScreen extends StatelessWidget {


  ProductModel model;


  DetailsScreen(this.model);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueAccent
              ),
              width: MediaQuery.of(context).size.width,
                height: 270,
                child: Image.network(model.image as String,)
            ),
            SizedBox(height: 15,),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                    child: Column(
                      children: [
                        CustomText(text: model.name as String,fontSize: 26,),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border:Border.all(color: Colors.grey) ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(text: 'Size',color: Colors.black,),
                                  CustomText(text: model.Sized as String,color: Colors.black,),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border:Border.all(color: Colors.grey) ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(text: 'Color',),
                                  Container(
                                    width: 30,
                                    height: 20,
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20),
                                      color: model.color
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15,),
                        CustomText(text: 'Details' ,fontSize: 18,),
                        SizedBox(height: 20,),
                        CustomText(
                          text: model.description as String,
                          fontSize: 18,
                          height: 2.5,
                        )
                      ],

                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(text: 'PRICE',
                        fontSize: 18,
                        color:Colors.grey ,),
                      SizedBox(height: 10,),
                      CustomText(text: model.price.toString(),color: Colors.blue,
                      fontSize: 18,
                      fontweight: FontWeight.w300,)
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                      child: ElevatedButton(onPressed: (){}
                          , child: CustomText(text: 'Add',color: Colors.white,)))

                ],
              ),
            )
          ],
        )
        ,),
    );
  }
}
