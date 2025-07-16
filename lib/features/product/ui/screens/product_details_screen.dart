import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:crafty_bay/features/product/ui/widgets/color_picker.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_description.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_image_slider.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_name_and_inc_dec_button.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_ratings_and_reviews.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_title.dart';
import 'package:crafty_bay/features/product/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name ='/product_details';
  final String productId;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ProductNameAndIncDecButton(),
                        ProductRatingsAndReviews(),
                        const ProductTitle(title: 'Color',),
                        const SizedBox(height: 8,),
                        ColorPicker(
                          colors: const ['Black', 'Blue', 'Pink', 'Yellow'],
                           onSelected: (String value){
                                                  
                           }),
                        const SizedBox(height: 16,),  
                        const ProductTitle(title: 'Size',),
                        const SizedBox(height: 8,),
                        SizePicker(
                          sizes: const ['S', 'M', 'L', 'X','XL','XXL'],
                           onSelected: (String value){
                                                  
                           }),
                        const SizedBox(height: 16,), 
                        const Text('Description', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),), 
                        const SizedBox(height: 8,), 
                        const ProductDescription(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPriceAndAddToCartSection(),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.15),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: [
              Column(
                children: [
                  Text('Price', 
                  style: Theme.of(context).textTheme.bodyLarge,),
                  Text('${Constants.takaSign}100',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.themeColor
                  ),),
                ],
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: (){},
                   child: Text('Add to Cart'),),
              ),
          ],),
        );
  }
}





