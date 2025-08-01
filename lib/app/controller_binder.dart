import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/auth/ui/controller/login_controller.dart';
import 'package:crafty_bay/features/auth/ui/controller/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/auth/ui/controller/sign_up_controller.dart';
import 'package:crafty_bay/features/auth/ui/controller/verify_otp_controller.dart';
import 'package:crafty_bay/features/auth/ui/screens/login_screen.dart';
import 'package:crafty_bay/features/cart/ui/controllers/cart_list_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/auth_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/home_slider_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:crafty_bay/features/product/controllers/add_to_cart_controller.dart';
import 'package:crafty_bay/features/product/controllers/product_review_controller.dart';
import 'package:crafty_bay/features/wishlist/ui/controllers/wish_list_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  final AuthController _authController = AuthController();
  @override
  void dependencies() {
    Get.put(_authController);
    Get.put(MainBottomNavController());
    Get.put(NetworkClient(
        onUnAuthorize: _onUnAuthorize, commonHeaders: _commonHeaders));

    Get.put(SignUpController());
    Get.put(VerifyOtpController());

    Get.put(LoginController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(PopularProductController());
    Get.put(AddToCartController());
    Get.put(CartListController());
    Get.put(WishListController());
    Get.put(ProductReviewController());
  }

  Future<void> _onUnAuthorize() async {
    await _authController.clearUserData();
    Get.to(() => LoginScreen());
  }

  Map<String, String> _commonHeaders() {
    return {
      'content-type': 'application/json',
      //'token': '',
      'token': _authController.accessToken ?? '',
    };
  }
}
