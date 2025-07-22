import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:crafty_bay/core/ui/snack_bar_message.dart';
import 'package:crafty_bay/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/auth/ui/screens/login_screen.dart';
import 'package:crafty_bay/features/common/ui/controllers/auth_controller.dart';
import 'package:crafty_bay/features/product/controllers/add_to_cart_controller.dart';
import 'package:crafty_bay/features/product/controllers/product_details_controller.dart';
import 'package:crafty_bay/features/product/data/models/product_details_model.dart';
import 'package:crafty_bay/features/product/ui/widgets/color_picker.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_description.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_image_slider.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_name_and_inc_dec_button.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_ratings_and_reviews.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_title.dart';
import 'package:crafty_bay/features/product/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = '/product_details';
  final String productId;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsController _productDetailsController =
      ProductDetailsController();
  final AddToCartController _addToCartController =
      Get.find<AddToCartController>();

  @override
  void initState() {
    super.initState();
    _productDetailsController.getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder(
          init: _productDetailsController,
          builder: (_) {
            if (_productDetailsController.inProgress) {
              return const CenteredCircularProgressIndicator();
            }

            if (_productDetailsController.errorMessage != null) {
              return Center(
                child: Text(_productDetailsController.errorMessage!),
              );
            }

            final ProductDetailsModel product =
                _productDetailsController.productDetails;

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductImageSlider(
                          images: product.photoUrls,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProductNameAndIncDecButton(
                                productName: product.title,
                              ),
                              ProductRatingsAndReviews(),
                              ProductTitle(
                                title: 'Color',
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              ColorPicker(colors: [
                                //product.colors[0],
                                'Red',
                                'Green',
                                'Blue',
                                'Pink',
                                'Yellow',
                              ], onSelected: (String value) {}),
                              const SizedBox(
                                height: 16,
                              ),
                              Visibility(
                                visible: product.colors.isNotEmpty,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Color',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ColorPicker(
                                      colors: product.colors,
                                      onSelected: (String value) {},
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              ),
                              const ProductTitle(
                                title: 'Size',
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SizePicker(sizes: const [
                                'S',
                                'M',
                                'L',
                                'X',
                                'XL',
                                'XXL'
                              ], onSelected: (String value) {}),
                              const SizedBox(
                                height: 16,
                              ),
                              Visibility(
                                visible: product.sizes.isNotEmpty,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Size',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ColorPicker(
                                      colors: product.sizes,
                                      onSelected: (String value) {},
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              ),
                              const Text(
                                'Description',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              ProductDescription(
                                description: product.description,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _buildPriceAndAddToCartSection(product),
              ],
            );
          }),
    );
  }

  Widget _buildPriceAndAddToCartSection(ProductDetailsModel product) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.15),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Price', style: Theme.of(context).textTheme.bodyLarge),
              Text(
                '${Constants.takaSign}${product.currentPrice}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: GetBuilder(
                init: _addToCartController,
                builder: (_) {
                  return Visibility(
                    visible: _addToCartController.inProgress == false,
                    replacement: CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: _onTapAddToCartButton,
                      child: Text('Add to Cart'),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Future<void> _onTapAddToCartButton() async {
    if (await Get.find<AuthController>().isUserLoggedIn()) {
      final bool result =
          await _addToCartController.addToCart(widget.productId);
      if (result) {
        showSnackBarMessage(context, 'Added to cart');
      } else {
        showSnackBarMessage(context, _addToCartController.errorMessage!);
      }
    } else {
      Navigator.pushNamed(context, LoginScreen.name);
    }
  }
}
