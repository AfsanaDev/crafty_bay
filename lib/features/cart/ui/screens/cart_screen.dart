import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/constants.dart';
import 'package:crafty_bay/features/auth/ui/controller/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
       canPop: false,
      onPopInvokedWithResult: (_,__){
        _backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
            title:  const Text('Cart'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios), 
              onPressed: () { 
                _backToHome();
               },
            ),
            
          ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return CartItem();
                },
                 separatorBuilder: (_, __)=> const SizedBox(height: 8,),)
              ),
            ),
            _buildPriceAndCheckoutSection(),
          ],
        ),
      ),
    );
  }
   Widget _buildPriceAndCheckoutSection() {
    return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.themeColor.withOpacity(0.15),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Price', 
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

  void _backToHome(){
    Get.find<MainBottomNavController>().backToHome();
  }
}

