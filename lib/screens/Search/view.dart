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
//mahih
  List<String> _searchResults = [];
  bool _isLoading = false;

  void _searchProducts(String searchText) {
    setState(() {
      _isLoading = true;
    });

    _productsCollection
        .where('name',
            isGreaterThanOrEqualTo: searchText, isLessThan: searchText + 'z')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        _searchResults =
            querySnapshot.docs.map((doc) => doc['name'] as String).toList();
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
      (product) => product.name == productName,
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
                padding: const EdgeInsets.only(left: 11),
                child: CustomText(
                  text: 'Welcome to',
                  color: AppColors.black,
                  fontSize: 20,
                  fontweight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: CustomText(
                  text: 'Moshtra',
                  color: AppColors.blue,
                  fontSize: 25,
                  fontweight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.white,
                ),
                child: TextFormField(

                  controller: _searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    hintText: 'What are you looking for?',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: AppColors.placeholder,
                    ),
                  ),
                  onChanged: (value) {
                    _searchProducts(value);
                  },
                  //ddd
                ),
              ),
              // SizedBox(height: 20),
              _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
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
            ],
          ),
        ),
      ),
    );
  }
}
