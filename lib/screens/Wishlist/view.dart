import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:moshtra/screens/Wishlist/model.dart';

import '../../utils/constants/assets.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return false ? buildEmptyWishList() : FavoriteScreen();
  }

  Widget buildEmptyWishList() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AssetsPaths.CartListEmpty),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text('Your wishlist is empty',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Color(0xff1C1B1B),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Tap heart button to start saving your favorite\nitems.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff6F7384),
                    height: 1.55,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    // Go To Categories

                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(328, 60),
                      backgroundColor: Color(0xff1C1B1B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      )
                  ),
                  child: Text(
                    'Explore Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  )
              ),

              // Icon Button Heart

            ]
        ),
      ),
    );
  }
}



class FavoriteScreen extends StatefulWidget {


  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  int itemCount = 1;

  BackButton() => IconButton(
    onPressed: (){},
    icon: Icon(Icons.arrow_back),
  );

  @override
  Widget build(BuildContext context) {

    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('WishList', style: TextStyle(color: Colors.grey),),
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            // centerTitle: true,

          ),
          body: ListView.builder(
            itemBuilder: (context , index) => buildFavItem(),
            itemCount: 1,
          ),
        ),
      );
  }

  Widget buildFavItem() => Padding(
    padding: const EdgeInsets.all(25.0),
    child: Container(
      height: 135,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image.asset(
                AssetsPaths.Watch,
                fit: BoxFit.contain,
                width: 130,
                height: 130,
              ),
              if(1 != 0)
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child:
                  Text('DISCOUNT',
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.white,
                    ),
                  ),
                )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Loop Silicone Strong Magnetic Watch",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$15.25",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 5,),
                    if( 1 != 0)
                      Text(
                        "\$20",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w500,

                        ),
                      ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0,
                          color: Colors.grey
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: (){
                                if(itemCount > 1) {
                                  itemCount--;
                                }
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Colors.grey,
                              )),
                          Text(
                            "${itemCount.toString()}",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          IconButton(
                              onPressed: (){
                                itemCount++;
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.grey,
                              )),
                        ],
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: (){

                          // ShopCubit.get(context).changeFavorites(model.product.id)

                        },
                        icon: CircleAvatar(
                          radius: 15.0,
                          backgroundColor:
                          //ShopCubit.get(context).favorites[model.id]
                          true ? Colors.red : Colors.grey,
                          child: Icon(
                            Icons.favorite_border,
                            size: 14.0,
                            color: Colors.white,
                          ),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
