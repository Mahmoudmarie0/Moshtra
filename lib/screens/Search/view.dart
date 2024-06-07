// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:moshtra/screens/Details/view.dart';
// import 'package:moshtra/utils/constants/colors.dart';
// import 'package:moshtra/utils/custom_text/view.dart';
// import '../../models/new_Category_model.dart';
// import '../../models/products_model.dart';
// import 'controller/controller.dart';
//
// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   final CollectionReference _productsCollection =
//       FirebaseFirestore.instance.collection('Products');
//
//
//   searchController controller = Get.put(searchController( ));
//
//
//
//
//
//
//
//
//
//   List<ProductModel> _searchResults = [];
//   bool _isLoading = false;
//
//   // void _searchProducts(String searchText) {
//   //   setState(() {
//   //     _isLoading = true;
//   //   });
//   //
//   //     final CollectionReference _productsCollection =
//   //     FirebaseFirestore.instance.collection('Products');
//   //
//   //     _productsCollection
//   //         .where(Get.locale?.languageCode == "en" ? 'nameEN' : 'nameAR',
//   //             isGreaterThanOrEqualTo: searchText.toUpperCase(),
//   //             isLessThanOrEqualTo:
//   //                 searchText.toUpperCase() + (Get.locale!.languageCode == "en" ? 'z' : 'ي'))
//   //         .get()
//   //         .then((QuerySnapshot querySnapshot) {
//   //       setState(() {
//   //         _searchResults = querySnapshot.docs
//   //             .map((doc) => Get.locale?.languageCode == "en"
//   //                 ? doc['nameEN'] as String
//   //                 : doc['nameAR'] as String)
//   //             .toList();
//   //         _isLoading = false;
//   //       });
//   //     }).catchError((error) {
//   //       setState(() {
//   //         _isLoading = false;
//   //       });
//   //       print('Error searching products: $error');
//   //     });
//   //   }
//   // void searchProducts(String searchText) async {
//   //   // Ensure loading state is set to true when search starts
//   //   setState(() {
//   //     _isLoading = true;
//   //   });
//   //
//   //   // Get reference to the Categories collection
//   //   CollectionReference categoriesCollection = FirebaseFirestore.instance.collection('Categories');
//   //
//   //   // Get all documents in the Categories collection
//   //   QuerySnapshot categoriesSnapshot = await categoriesCollection.get();
//   //
//   //   // List to store search results
//   //   List<String> allSearchResults = [];
//   //
//   //   // Iterate through each document in the Categories collection
//   //   for (QueryDocumentSnapshot categoryDoc in categoriesSnapshot.docs) {
//   //     // Get reference to the Products collection within this category document
//   //     CollectionReference productsCollection = categoryDoc.reference.collection('Products');
//   //
//   //     // Determine the field to search based on locale
//   //     String searchField = Get.locale?.languageCode == "en" ? 'nameEN' : 'nameAR';
//   //     String searchEndChar = Get.locale?.languageCode == "en" ? 'z' : 'ي';
//   //
//   //     // Perform the search query on the Products collection
//   //     QuerySnapshot productsSnapshot = await productsCollection
//   //         .where(searchField, isGreaterThanOrEqualTo: searchText.toUpperCase())
//   //         .where(searchField, isLessThanOrEqualTo: searchText.toUpperCase() + searchEndChar)
//   //         .get();
//   //
//   //     // Process the documents in the Products collection
//   //     List<String> searchResults = productsSnapshot.docs
//   //         .map((doc) => Get.locale?.languageCode == "en"
//   //         ? doc['nameEN'] as String
//   //         : doc['nameAR'] as String)
//   //         .toList();
//   //
//   //     // Add current search results to the overall results
//   //     allSearchResults.addAll(searchResults);
//   //   }
//   //
//   //   // Update state with the search results
//   //   setState(() {
//   //     _searchResults = allSearchResults;
//   //     _isLoading = false;
//   //   });
//   // }
//
//   void searchProducts(String searchText) async {
//     setState(() {
//       _isLoading = true;
//     });
//
//     CollectionReference categoriesCollection = FirebaseFirestore.instance.collection('Categories');
//     QuerySnapshot categoriesSnapshot = await categoriesCollection.get();
//     List<ProductModel> allSearchResults = [];
//
//     for (QueryDocumentSnapshot categoryDoc in categoriesSnapshot.docs) {
//       CollectionReference productsCollection = categoryDoc.reference.collection('Products');
//       String searchField = Get.locale?.languageCode == "en" ? 'nameEN' : 'nameAR';
//       String searchEndChar = Get.locale?.languageCode == "en" ? 'z' : 'ي';
//
//       QuerySnapshot productsSnapshot = await productsCollection
//           .where(searchField, isGreaterThanOrEqualTo: searchText.toUpperCase())
//           .where(searchField, isLessThanOrEqualTo: searchText.toUpperCase() + searchEndChar)
//           .get();
//
//       List<ProductModel> searchResults = productsSnapshot.docs
//           .map((doc) => ProductModel.fromSnapshot(doc))
//           .toList();
//
//       allSearchResults.addAll(searchResults);
//     }
//
//     setState(() {
//       _searchResults = allSearchResults;
//       _isLoading = false;
//     });
//   }
//
//
//   Cat_Model? get CatModel => _CatModel;
//   Cat_Model? _CatModel ;
//
//
//
//   // void _navigateToDetailsScreen(String productName) {
//   //
//   //   var product = _CatModel ?. product.firstWhere(
//   //     (product) =>
//   //         product.nameEN == productName || product.nameAR == productName,
//   //      // orElse: () => null,
//   //   );
//   //
//   //   if (product != null) {
//   //     Get.to(DetailsScreen(  product));
//   //   }
//   // }
//
//
//
//   void _navigateToDetailsScreen(ProductModel product) {
//     Get.to(() => DetailsScreen(product));
//   }
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.grayish_blue,
//       body: Padding(
//         padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
//         child: Container(
//           height: double.infinity,
//           color: AppColors.grayish_blue,
//           child: Column(
//             children: [
//               Padding(
//                 padding: Get.locale?.languageCode == "en"
//                     ? const EdgeInsets.only(left: 11)
//                     : const EdgeInsets.only(left: 290),
//                 child: CustomText(
//                   text: 'Welcome_to'.tr,
//                   color: AppColors.black,
//                   fontSize: 20,
//                   fontweight: FontWeight.w500,
//                 ),
//               ),
//               SizedBox(height: 5.h),
//               Padding(
//                 padding: Get.locale?.languageCode == "en"
//                     ? const EdgeInsets.only(left: 11)
//                     : const EdgeInsets.only(left: 315),
//                 child: CustomText(
//                   text: 'Moshtra'.tr,
//                   color: AppColors.blue,
//                   fontSize: 25,
//                   fontweight: FontWeight.w800,
//                 ),
//               ),
//               SizedBox(height: 20.h),
//               Container(
//                 width: 343.w,
//                 height: 48.h,
//                 // width: double.infinity,
//                 padding: EdgeInsets.only(right: 30),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: AppColors.white,
//                 ),
//                 child: TextFormField(
//                   controller: _searchController,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     prefixIcon: Get.locale?.languageCode == "en"
//                         ? Icon(
//                             Icons.search,
//                             color: Colors.black,
//                           )
//                         : null,
//                     suffixIcon: Get.locale?.languageCode == "ar"
//                         ? Icon(
//                             Icons.search,
//                             color: Colors.black,
//                           )
//                         : null,
//                     hintText: 'search_hint'.tr,
//                     hintStyle: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w300,
//                       color: AppColors.placeholder,
//                     ),
//                   ),
//                   onChanged: (value) {
//                     setState(() {
//                       value == ""
//                           ? _searchResults = []
//                           : searchProducts(value);
//                     });
//                   },
//                   //ddd
//                 ),
//               ),
//               // SizedBox(height: 20),
//               _isLoading
//                   ? Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : Expanded(
//                       child: ListView.builder(
//                         //physics: NeverScrollableScrollPhysics(),
//                         padding: EdgeInsets.zero,
//                         shrinkWrap: true,
//                         itemCount: _searchResults.length,
//                         itemBuilder: (context, index) {
//                           final productName = _searchResults[index];
//                           return ListTile(
//                             title: Text(productName as String),
//                             onTap: () {
//                               _navigateToDetailsScreen(productName );
//                             },
//                           );
//                         },
//                       ),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moshtra/models/products_model.dart';
import '../../utils/constants/colors.dart';
import '../../utils/custom_text/view.dart';
import '../Details/view.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isLoading = false;
  List<ProductModel> _searchResults = [];
  TextEditingController _searchController = TextEditingController();

  // void searchProducts(String searchText) async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //
  //   CollectionReference categoriesCollection = FirebaseFirestore.instance.collection('Categories');
  //   QuerySnapshot categoriesSnapshot = await categoriesCollection.get();
  //   List<ProductModel> allSearchResults = [];
  //
  //   for (QueryDocumentSnapshot categoryDoc in categoriesSnapshot.docs) {
  //     CollectionReference productsCollection = categoryDoc.reference.collection('Products');
  //     String searchField = Get.locale?.languageCode == "en" ? 'nameEN' : 'nameAR';
  //     String searchEndChar = Get.locale?.languageCode == "en" ? 'z' : 'ي';
  //
  //     QuerySnapshot productsSnapshot = await productsCollection
  //         .where(searchField, isGreaterThanOrEqualTo: searchText.toUpperCase())
  //         .where(searchField, isLessThanOrEqualTo: searchText.toUpperCase() + searchEndChar)
  //         .get();
  //
  //     List<ProductModel> searchResults = productsSnapshot.docs
  //         .map((doc) => ProductModel.fromSnapshot(doc))
  //         .toList();
  //
  //     allSearchResults.addAll(searchResults);
  //   }
  //
  //   setState(() {
  //     _searchResults = allSearchResults;
  //     _isLoading = false;
  //   });
  // }
  void searchProducts(String searchText) async {
    if (searchText.isEmpty) {
      setState(() {
        _searchResults = [];
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    CollectionReference categoriesCollection = FirebaseFirestore.instance.collection('Categories');
    QuerySnapshot categoriesSnapshot = await categoriesCollection.get();
    List<ProductModel> allSearchResults = [];

    for (QueryDocumentSnapshot categoryDoc in categoriesSnapshot.docs) {
      CollectionReference productsCollection = categoryDoc.reference.collection('Products');
      String searchField = Get.locale?.languageCode == "en" ? 'nameEN' : 'nameAR';
    //  String searchEndChar = Get.locale?.languageCode == "en" ? 'z' : 'ي';

      QuerySnapshot productsSnapshot = await productsCollection
          .where(searchField, isGreaterThanOrEqualTo: searchText.toUpperCase())
          // .where(searchField, isLessThanOrEqualTo: searchText.toUpperCase() + searchEndChar)
          .get();

      List<ProductModel> searchResults = productsSnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .where((product) =>
      (product.nameEN != null && product.nameEN!.toLowerCase().contains(searchText.toLowerCase())) ||
          (product.nameAR != null && product.nameAR!.contains(searchText)))
          .toList();


      print (searchResults);

      allSearchResults.addAll(searchResults);
    }

    setState(() {
      _searchResults = allSearchResults;
      _isLoading = false;
    });
  }












  void _navigateToDetailsScreen(ProductModel product) {
    Get.to(() => DetailsScreen(product));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayish_blue,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
        child: Container(
          height: double.infinity,
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
                  fontSize: 20,
                  fontweight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: Get.locale?.languageCode == "en"
                    ? const EdgeInsets.only(left: 11)
                    : const EdgeInsets.only(left: 315),
                child: CustomText(
                  text: 'Moshtra'.tr,
                  color: AppColors.blue,
                  fontSize: 25,
                  fontweight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: 343.w,
                height: 48.h,
                padding: EdgeInsets.only(right: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white,
                ),
                child: TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Get.locale?.languageCode == "en"
                        ? Icon(Icons.search, color: Colors.black)
                        : null,
                    suffixIcon: Get.locale?.languageCode == "ar"
                        ? Icon(Icons.search, color: Colors.black)
                        : null,
                    hintText: 'search_hint'.tr,
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: AppColors.placeholder,
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        _searchResults = [];
                      });
                    } else {
                      searchProducts(value);
                    }
                  },
                ),
              ),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final product = _searchResults[index];
                    return ListTile(
                      title: Text(Get.locale?.languageCode == "en" ? product.nameEN ?? "" : product.nameAR ?? ""),
                      onTap: () => _navigateToDetailsScreen(product),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
