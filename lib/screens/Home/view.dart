import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moshtra/models/newFav_model.dart';
import 'package:moshtra/screens/Categories/view.dart';
import 'package:moshtra/screens/Home/controller/Controller.dart';
import 'package:moshtra/screens/Home/widgets/ListviewCategory.dart';
import 'package:moshtra/utils/custom_widgets/global_widgets/products_ListView.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../models/products_model.dart';
import '../../models/user_history_model.dart';
import '../../utils/constants/colors.dart';
import '../../utils/custom_text/view.dart';
import '../../utils/custom_widgets/global_widgets/SearchField.dart';
import '../Categories/SubCategory/subCategory_view.dart';
import '../Categories/controller/Controller.dart';
import '../Details/view.dart';
import '../Wishlist/view.dart';

// import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
//Get.locale?.languageCode == "en"
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductModel? model;
  CategoryController categoryController = Get.put(CategoryController());

  List<QueryDocumentSnapshot> data = [];

  List<ProductModel> BestSellerProducts = [];


  CollectionReference fav = FirebaseFirestore.instance.collection('favorites');
  CollectionReference User_history = FirebaseFirestore.instance.collection('User_history');


  bool isNotExist = true;

  bool? isSelected;

  int count = 1;

  String productId = "";

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('favorites')
        .get() as QuerySnapshot<Object?>;
    data = [];
    data.addAll(querySnapshot.docs);
    print('DataLength => ${data.length}');

    for (int i = 0; i < data.length; i++) {
      if (data[i]['userId'] == FirebaseAuth.instance.currentUser!.uid &&
          data[i]['product']['productId'] == productId) {
        ++count;
      }
    }

    if (count > 1) isNotExist = false;

    print('isExist => ${isNotExist}');
    print('Counter => ${count}');

    setState(() {});
  }

  // late File _image;
  // dynamic _probability = 0;
  // String? _result;
  // final picker = ImagePicker();
  // late tfl.Interpreter _interpreter;
  // List<String>? _labels;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   loadModel().then((_) {
  //     loadLabels().then((loadedLabels) {
  //       setState(() {
  //         _labels = loadedLabels;
  //       });
  //     });
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   _interpreter.close();
  //   super.dispose();
  // }
  //
  // void pickImageFromGallery() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   if(pickedFile != null)
  //     _setImage(File(pickedFile.path));
  // }
  //
  // void pickImageFromCamera() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.camera);
  //   if(pickedFile != null)
  //     _setImage(File(pickedFile.path));
  // }
  //
  // void _setImage(File image){
  //   setState(() {
  //     _image = image;
  //   });
  //   runInference();
  // }
  //
  // Future<void> loadModel() async {
  //   try {
  //     _interpreter = await tfl.Interpreter.fromAsset('assets/MLModel/model_unquant.tflite');
  //     print('Model Loaded');
  //   } catch (e) {
  //     print('Error loading model: $e');
  //   }
  // }
  //
  // Future<List<String>> loadLabels() async {
  //   final labelsData =
  //   await DefaultAssetBundle.of(context).loadString('assets/MLModel/labels.txt');
  //   print('Labels Loaded');
  //   return labelsData.split('\n');
  // }
  //
  // Future<Uint8List> preprocessImage(File imageFile) async {
  //   // Decode the image to an Image object
  //   img.Image? originalImage = img.decodeImage(await imageFile.readAsBytes());
  //
  //   // Resize the image to the correct size
  //   img.Image resizedImage =
  //   img.copyResize(originalImage!, width: 224, height: 224);
  //
  //   // Convert to a byte buffer in the format suitable for TensorFlow Lite (RGB)
  //   // The model expects a 4D tensor [1, 224, 224, 3]
  //   // Flatten the resized image to match this shape
  //   Uint8List bytes = resizedImage.getBytes();
  //
  //
  //   return bytes;
  // }
  //
  // Future<void> runInference() async {
  //   if (_labels == null) {
  //     return;
  //   }
  //
  //   try {
  //     Uint8List inputBytes = await preprocessImage(_image);
  //     var input = inputBytes.buffer.asUint8List().reshape([1, 224, 224, 3]);
  //     var outputBuffer = List<dynamic>.filled(1 * 7, 0).reshape([1, 7]);
  //
  //     _interpreter.run(input, outputBuffer);
  //
  //     // Assuming output is now List<List<int>> after inference
  //     List<double> output = outputBuffer[0];
  //
  //     // Print raw output for debugging
  //     print('Raw output: $output');
  //
  //     // Calculate probability
  //     double maxScore = output.reduce(max);
  //     _probability = (maxScore / 255.0); // Convert to percentage
  //
  //     // Get the classification result
  //     int highestProbIndex = output.indexOf(maxScore);
  //     String classificationResult = _labels![highestProbIndex];
  //
  //     setState(() {
  //       _result = classificationResult;
  //       // _probability is updated with the calculated probability
  //     });
  //
  //     print("Class Label is => ${_result}");
  //     //navigateToResult();
  //   } catch (e) {
  //     print('Error during inference: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: AppColors.grayish_blue,
              body: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
                  child: Container(
                    color: AppColors.grayish_blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: Get.locale?.languageCode == "en"
                              ? const EdgeInsets.only(left: 11)
                              : const EdgeInsets.only(left: 290),
                          child: CustomText(
                            text: 'Welcome_to'.tr,
                            color: AppColors.black,
                            fontSize: 20.sp,
                            fontweight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding: Get.locale?.languageCode == "en"
                              ? const EdgeInsets.only(left: 11)
                              : const EdgeInsets.only(left: 315),
                          child: CustomText(
                            text: 'Moshtra'.tr,
                            color: AppColors.blue,
                            fontSize: 25.sp,
                            fontweight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SearchTextFormField(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: SmartRefresher(
                    onRefresh: () async {
                      // controller.productModel.clear();
                      // await controller.getBestSellingProducts();
                      controller.onRefresh();
                      //  controller. productModel.clear();
                      //  controller. categoryModel.clear();
                      //  controller.  bannerModel.clear();
                      //  await controller. getCategory();
                      //  await controller. getBanners();
                      //  await controller.getBestSellingProducts();
                      controller.refreshController.refreshCompleted();
                      controller.refreshController.refreshCompleted();
                    },
                    // onLoading: () {
                    //   controller.getInvoices(isRefresh: false);
                    // },
                    enablePullUp: true,
                    controller: controller.refreshController,
                    scrollController: controller.scrollController,
                    child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        children: [
                          Column(
                            children: [
                              CarouselSlider(
                                items: controller.bannerModel
                                    .map(
                                      (e) => GestureDetector(
                                        onTap: () async {
                                          await categoryController.LoadData(3);
                                          if (categoryController
                                              .CatModel[3].product.isNotEmpty) {
                                            Get.to(SubCategoryScreen(
                                                categoryController
                                                    .CatModel[3].product
                                                    .toList(),
                                                Get.locale?.languageCode == "en"
                                                    ? categoryController
                                                        .CatModel[3].nameEN
                                                        .toString()
                                                    : categoryController
                                                        .CatModel[3].nameAR
                                                        .toString()));
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              left: 13, right: 13),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.r),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            child: Image(
                                              image: NetworkImage('${e.Image}'),
                                              width: 400.w,
                                              height: 150.h,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                options: CarouselOptions(
                                  height: 200.0,
                                  initialPage: 0,
                                  viewportFraction: 1.0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      Duration(seconds: 1),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: Get.locale?.languageCode == "en"
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: 'Categories'.tr,
                                            fontSize: 18,
                                            fontweight: FontWeight.w800,
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Get.to(CategoriesScreen());
                                            },
                                            child: CustomText(
                                              text: 'See_All'.tr,
                                              fontSize: 16,
                                              fontweight: FontWeight.w500,
                                              color: AppColors.orange,
                                            ),
                                          )
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Get.to(CategoriesScreen());
                                            },
                                            child: CustomText(
                                              text: 'See_All'.tr,
                                              fontSize: 16,
                                              fontweight: FontWeight.w500,
                                              color: AppColors.orange,
                                            ),
                                          ),
                                          CustomText(
                                            text: 'Categories'.tr,
                                            fontSize: 18,
                                            fontweight: FontWeight.w800,
                                          ),
                                        ],
                                      ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              // ListViewCategory(),
                              StreamBuilder<QuerySnapshot>(
                                stream: User_history.orderBy('createdAt', descending: true).snapshots(),
                                builder:(context , snapshot) {
                                  List<user_history> histList = [];
                                  List<ProductModel> myhistproducts = [];
                                  BestSellerList();
                                  if(!snapshot.hasData)
                                    return CircularProgressIndicator();
                                  else{
                                    for (int i = 0; i < snapshot.data!.docs.length; i++) {
                                      if (snapshot.data!.docs[i].get('userId') ==
                                      FirebaseAuth.instance.currentUser!.uid) {
                                      histList.add(user_history.fromSnapshot(snapshot.data!.docs[i]));
                                      myhistproducts.add(ProductModel.fromJson(snapshot.data!.docs[i]['product']));

                                      }
                                    }
                                  }
                                  if(histList.length == 0)
                                    return Container();
                                  else
                                    return productsList(myhistproducts);
                                }),
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: Get.locale?.languageCode == "en"
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: 'Latest_Products'.tr,
                                            fontSize: 18,
                                            fontweight: FontWeight.w800,
                                          ),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Spacer(),
                                          CustomText(
                                            text: 'Latest_Products'.tr,
                                            fontSize: 18,
                                            fontweight: FontWeight.w800,
                                          ),
                                        ],
                                      ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              ListViewProduct(),
                              // productsList(controller.histProducts),
                            ],
                          ),
                        ]),
                  ),
                ),
              ]),
              floatingActionButton: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton.small(
                    heroTag: 'camera',
                    onPressed: () {
                      // pickImageFromCamera();
                    },
                    child: Icon(Icons.camera_alt_outlined),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  FloatingActionButton(
                    heroTag: 'gallery',
                    onPressed: () {
                      // pickImageFromGallery();
                    },
                    child: Icon(Icons.image),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                  )
                ],
              ),
            ),
    );
  }

  ListViewProduct() {
    return GetBuilder<HomeController>(
      builder: (controller) => GridView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.20,
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 0.5,
          ),
          itemCount: controller.productModel.length,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width * .4,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.addHistory(controller.productModel[index]);
                      Get.to(DetailsScreen(controller.productModel[index]));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * .4,
                      height: 135.h,
                      child: Container(
                        height: 138.h,
                        width: 160.w,
                        child: Stack(alignment: Alignment.center, children: [
                          Image.network(
                            controller.productModel[index].image as String,
                            fit: BoxFit.cover,
                            width: 100,
                          ),
                          StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('favorites')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                List<String> productIds = [];
                                if (!snapshot.hasData) {
                                  return CircularProgressIndicator();
                                } else {
                                  List<new_fav> favList = [];
                                  for (int i = 0;
                                      i < snapshot.data!.docs.length;
                                      i++) {
                                    if (snapshot.data!.docs[i].get('userId') ==
                                        FirebaseAuth
                                            .instance.currentUser!.uid) {
                                      favList.add(new_fav.fromSnapshot(
                                          snapshot.data!.docs[i]));

                                      productIds.add(snapshot.data!.docs[i]
                                          ['product']['productId']);
                                    }
                                  }
                                }

                                return Container(
                                  padding:
                                      EdgeInsets.only(left: 110, bottom: 100),
                                  child: MaterialButton(
                                    onPressed: () async {
                                      productId = controller
                                          .productModel[index].productId!;
                                      await getData();

                                      if (isNotExist) {
                                        fav.add({
                                          'product': controller
                                              .productModel[index]
                                              .toJson(),
                                          'createdAt': DateTime.now(),
                                          'userId': FirebaseAuth
                                              .instance.currentUser!.uid
                                              .toString()
                                        });

                                        showSnackBarFun(context,
                                            'The product has been added to\nyour Favorite');
                                        count = 1;
                                        isNotExist = true;
                                      } else {
                                        print(
                                            ' ProIndexFromModel => ${controller.productModel[index].productId}');

                                        for (int i = 0;
                                            i < snapshot.data!.docs.length;
                                            i++) {
                                          if (snapshot.data!.docs[i]
                                                      .get('userId') ==
                                                  FirebaseAuth.instance
                                                      .currentUser!.uid &&
                                              snapshot.data!.docs[i]['product']
                                                      ['productId'] ==
                                                  controller.productModel[index]
                                                      .productId) {
                                            fav
                                                .doc(snapshot.data!.docs[i].id)
                                                .delete();
                                            print(
                                                'DocID => ${snapshot.data!.docs[i].id}');
                                            print(
                                                'ProductID (snapshot) => ${snapshot.data!.docs[i]['product']['productId']}');
                                            print(
                                                'ProductID (model) => ${controller.productModel[index].productId}');
                                          }
                                        }

                                        showSnackBarFun(context,
                                            'The product has been deleted\nfrom your Favorite');
                                        count = 1;
                                        isNotExist = true;
                                      }
                                    },
                                    child: productIds.length == 0
                                        ? Center(
                                            child: Icon(Icons.favorite_border))
                                        : productIds.contains(controller
                                                .productModel[index].productId)
                                            ? Center(
                                                child: Icon(Icons.favorite))
                                            : Center(
                                                child: Icon(
                                                    Icons.favorite_border)),
                                    textColor: Colors.red,
                                  ),
                                );
                              }),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 105 , right: 50),
                            child: controller.productModel[index].quantity == "0" ?
                            Container(
                              height: 20,
                              width: 100,
                              alignment: Alignment.center,
                              color: Colors.red,
                              child: Text("Out Of Stock" , style: TextStyle(color: Colors.white),),
                            ) : Container(),
                          )
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  CustomText(
                    text: Get.locale?.languageCode == "en"
                        ? controller.productModel[index].nameEN as String
                        : controller.productModel[index].nameAR as String,
                    alignment: Alignment.center,
                    fontweight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomText(
                    text: Get.locale?.languageCode == "en"
                        ? controller.productModel[index].sub_descriptionEN
                            as String
                        : controller.productModel[index].sub_descriptionAR
                            as String,
                    alignment: Alignment.center,
                    color: AppColors.grey,
                    fontweight: FontWeight.w400,
                    maxLine: 1,
                    fontSize: 13,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomText(
                    text: controller.productModel[index].price.toString() +
                        ' EGP',
                    color: AppColors.black,
                    fontweight: FontWeight.w500,
                    alignment: Alignment.center,
                    fontSize: 12,
                  ),
                ],
              ),
            );
          }),
    );
  }

  showSnackBarFun(context, String msg) {
    SnackBar snackBar = SnackBar(
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
        duration: Duration.millisecondsPerSecond.milliseconds,
        elevation: 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: AppColors.white,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 200,
            left: 15,
            right: 15),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Icons.task_alt_rounded,
                  color: AppColors.Green,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  msg,
                  //'The product has been added to\nyour Favorite',
                  style: TextStyle(
                    color: AppColors.black,
                  ),
                )
              ],
            ),
            Expanded(
              child: GestureDetector(
                child: Text(
                  'View Favorite',
                  style: TextStyle(color: AppColors.orange),
                ),
                onTap: () {
                  Get.to(MyFavScreen());
                },
              ),
            )
          ],
        ));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> BestSellerList() async {

    BestSellerProducts = [];

    // Get a reference to the main collection
    CollectionReference categories = FirebaseFirestore.instance.collection('Categories');

    // Get all documents from the main collection
    QuerySnapshot categoriesDocs = await categories.get();

    // Iterate over each document in the main collection
    categoriesDocs.docs.forEach((mainDocument) async {
      // Get a reference to the subcollection of the current document
      CollectionReference products = mainDocument.reference.collection('Products');
      // mainDocument.get('name');
      // print('categoriesDocs =>  ${mainDocument.id}');

      // Get all documents from the subcollection
      QuerySnapshot productsDocs = await products.get();


        for (int j = 0; j < productsDocs.size; j++) {

          if(int.parse(productsDocs.docs[j].get('number_of_order')) > 5){

            print('ProductDocId Added => ${productsDocs.docs[j].id}');

            BestSellerProducts.add(ProductModel.fromSnapshot(productsDocs.docs[j]));

          }

        }
      }
    );

    print('Length Of BestSeller List => ${BestSellerProducts.length}');

  }
}
