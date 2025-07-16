import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('''Nike shoes are generally made with a combination of materials, including leather, fabric, foam, and rubber. The specific materials can vary depending on the model.''',
    style: TextStyle(
     fontSize: 14,
     fontWeight: FontWeight.w500,
     color: Colors.black54
    ),
    );
  }
}