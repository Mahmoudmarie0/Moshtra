import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:moshtra/screens/Details/view.dart';
import 'package:moshtra/screens/Home/controller/Controller.dart';
import 'package:moshtra/utils/constants/colors.dart';
import 'package:moshtra/utils/custom_text/view.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final CollectionReference _productsCollection =
      FirebaseFirestore.instance.collection('Products');
  HomeController homeController = Get.put(HomeController());
  List<String> _searchResults = [];
  bool _isLoading = false;

  void _searchProducts(String searchText) {
    setState(() {
      _isLoading = true;
    });

    _productsCollection
        .where(Get.locale?.languageCode == "en" ? 'nameEN' : 'nameAR',
            isGreaterThanOrEqualTo: searchText,
            isLessThanOrEqualTo:
                searchText + (Get.locale!.languageCode == "en" ? 'z' : 'ي'))
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        _searchResults = querySnapshot.docs
            .map((doc) => Get.locale?.languageCode == "en"
                ? doc['nameEN'] as String
                : doc['nameAR'] as String)
            .toList();
        _isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        _isLoading = false;
      });
      print('Error searching products: $error');
    });
  }

  void _navigateToDetailsScreen(String productName) {
    // Find the corresponding product in homeController's productModel list
    var product = homeController.productModel.firstWhere(
      (product) =>
          product.nameEN == productName || product.nameAR == productName,
      // orElse: () => null,
    );

    if (product != null) {
      Get.to(DetailsScreen(product));
    }
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
                // width: double.infinity,
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
                        ? Icon(
                            Icons.search,
                            color: Colors.black,
                          )
                        : null,
                    suffixIcon: Get.locale?.languageCode == "ar"
                        ? Icon(
                            Icons.search,
                            color: Colors.black,
                          )
                        : null,
                    hintText: 'search_hint'.tr,
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: AppColors.placeholder,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      value == ""
                          ? _searchResults = []
                          : _searchProducts(value);
                    });
                  },
                  //ddd
                ),
              ),
              // SizedBox(height: 20),
              _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView.builder(
                        //physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          final productName = _searchResults[index];
                          return ListTile(
                            title: Text(productName),
                            onTap: () {
                              _navigateToDetailsScreen(productName);
                            },
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
