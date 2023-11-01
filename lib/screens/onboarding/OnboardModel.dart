import '../../utils/constants/assets.dart';

class onboardmodel {
  String title;
  String image;
  String body;
  onboardmodel({required this.image, required this.body, required this.title});
}
List<onboardmodel> onboardlist = [
  onboardmodel(
      title: "Explore a wide range of products",
      body: "Explore a wide range of products at your fingertips QuickMart offers an extensive collection to suit your needs",
      image:AssetsPaths.OnBoarding1
     ),
  onboardmodel(
      title: "Unlock exclusive offers and discounts",
      body: "Get access to limited-time deals and special promotions available only to our valued customers",
      image: AssetsPaths.OnBoarding2),
  onboardmodel(
      title: "Safe and secure payments",
      body: "QuickMart employs industry-leading encryption and trusted payment gateways to safeguard your financial information",
      image:
      AssetsPaths.OnBoarding3),

];