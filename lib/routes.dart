import 'package:flutter/material.dart';
import 'package:my_store/screens/home_screen.dart';
import 'package:my_store/screens/productDetails/product_details_screen.dart';
import 'package:my_store/screens/products/products_screen.dart';
import 'package:my_store/screens/splash_screen.dart';
import 'package:my_store/widgets/small_text.dart';

class AppRoutes {
  static const productDetails = '/details-screen';
  static const productScreen = '/product-screen';
  static const splashScreen = '/';
  static const homeScreen = '/home-screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case splashScreen:
        return MaterialPageRoute(
            builder: (context) =>  const SplashScreen());

      case homeScreen:
        return MaterialPageRoute(
            builder: (context) =>  const HomeScreen());

      case productDetails:
        final arg = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(model: arg['arg']));

      case productScreen:
        final arg = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => ProductsScreen(category: arg['arg']));

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: SmallText(text: 'This route does not exists.'),
                  ),
                ));
    }
  }
}
