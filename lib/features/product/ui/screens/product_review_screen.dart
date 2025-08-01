import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/product/ui/screens/create_product_review_screen.dart';
import 'package:crafty_bay/features/product/ui/widgets/review_details.dart';
import 'package:flutter/material.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({
    super.key,
  });

  static const String name = '/product_review';

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reviews'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReviewDetailsWidget(),
                      const SizedBox(
                        height: 8,
                      ),
                      ReviewDetailsWidget(),
                      const SizedBox(
                        height: 8,
                      ),
                      ReviewDetailsWidget(),
                      const SizedBox(
                        height: 8,
                      ),
                      ReviewDetailsWidget(),
                      const SizedBox(
                        height: 8,
                      ),
                      ReviewDetailsWidget(),
                      const SizedBox(
                        height: 32,
                      )
                    ],
                  ),
                ),
              ),
            ),
            _buildPriceAndAddToCartSection(),
          ],
        ));
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.06),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Reviews(1000)', style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(shape: CircleBorder()),
              onPressed: () {
                Navigator.pushNamed(context, CreateProductReviewScreen.name);
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
