import 'package:crafty_bay/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  ProductListScreen({super.key, required this.category});

  final String category;

  static final String name = '/product-list';
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: GetBuilder<CategoryListController>(builder: (controller) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                  // controller: _scrollController,
                  itemCount: 30,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return FittedBox(child: ProductCard());
                  }),
            ),
            // Visibility(
            //     visible: controller.inProgress,
            //     child: const LinearProgressIndicator())
          ],
        );
      }),
    );
  }
}
