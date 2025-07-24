import 'package:crafty_bay/features/product/ui/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';

class ProductNameAndIncDecButton extends StatelessWidget {
  ProductNameAndIncDecButton({super.key, required this.productName});
  final String productName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            productName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.7,
              color: Colors.black54,
            ),
          ),
        ),
        IncDecButton(
          onChange: (int value) {},
        ),
      ],
    );
  }
}
