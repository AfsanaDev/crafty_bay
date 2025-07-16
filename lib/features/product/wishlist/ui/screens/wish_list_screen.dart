import 'package:crafty_bay/features/auth/ui/controller/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key,});

  
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){
        _backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title:  const Text('WishList'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios), 
            onPressed: () { 
              _backToHome();
             },
          ),
          
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView.builder(
            itemCount: 30,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              ), 
            itemBuilder: (context, index){
              return FittedBox(child: ProductCard());
            }),
        ),
      ),
    );
  }

  void _backToHome(){
    Get.find<MainBottomNavController>().backToHome();
  }
}