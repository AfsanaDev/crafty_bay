import 'package:crafty_bay/features/product/ui/widgets/product_description.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  static final String name ='/product-reviews';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
      onPressed: (){
        Navigator.pop(context);
      },),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                  Row(children: [
                    Icon(Icons.person_2_outlined, size: 28, color: Colors.grey,),
                    const SizedBox(width: 8,),
                    Text('Afsana Akter',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black54
                    ),),
                  ],),
                  const SizedBox(height: 8,),
                 ProductDescription(), 
              ],
            ),
          )
        ],
      ),
    );
  }

  
}

