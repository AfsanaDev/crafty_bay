import 'package:crafty_bay/features/auth/ui/screens/login_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/splash_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/common/models/category_model.dart';
import 'package:crafty_bay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/features/product/ui/screens/create_product_review_screen.dart';
import 'package:crafty_bay/features/product/ui/screens/product_details_screen.dart';
import 'package:crafty_bay/features/product/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/features/product/ui/screens/product_review_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    late final Widget screenWidget;

    if (settings.name == SplashScreen.name) {
      screenWidget = const SplashScreen();
    } else if (settings.name == LoginScreen.name) {
      screenWidget = const LoginScreen();
    } else if (settings.name == SignUpScreen.name) {
      screenWidget = const SignUpScreen();
    } else if (settings.name == MainBottomNavScreen.name) {
      screenWidget = const MainBottomNavScreen();
    } else if (settings.name == ProductListScreen.name) {
      final CategoryModel category = settings.arguments as CategoryModel;
      screenWidget = ProductListScreen(category: category);
    } else if (settings.name == ProductDetailsScreen.name) {
      final String productId = settings.arguments as String;
      screenWidget = ProductDetailsScreen(productId: productId);
    } else if (settings.name == ProductReviewScreen.name) {
      screenWidget = const ProductReviewScreen();
    } else if (settings.name == CreateProductReviewScreen.name) {
      screenWidget = const CreateProductReviewScreen();
    } else if (settings.name == VerifyOtpScreen.name) {
      final String email = settings.arguments as String;
      screenWidget = VerifyOtpScreen(email: email);
    }

    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
