import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/product/ui/screens/product_review_screen.dart';

import 'package:flutter/material.dart';

class ProductRatingsAndReviews extends StatelessWidget {
  const ProductRatingsAndReviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          children: [
            Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            Text(
              '4.5',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, ProductReviewScreen.name);
          },
          child: Text(
            'Reviews',
          ),
        ),
        Card(
          color: AppColors.themeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Icon(
              Icons.favorite_outline_rounded,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
