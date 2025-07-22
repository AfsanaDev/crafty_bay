import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/auth/ui/controller/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/common/ui/controllers/category_list_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_card.dart';
import 'package:crafty_bay/features/home/ui/controllers/home_slider_controller.dart';
import 'package:crafty_bay/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:crafty_bay/features/home/ui/screens/wigets/app_bar_icon_button.dart';
import 'package:crafty_bay/features/common/ui/widgets/home_carousel_slider.dart';
import 'package:crafty_bay/features/common/ui/widgets/product_category_item.dart';
import 'package:crafty_bay/features/home/ui/screens/wigets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              productSearchBar(),
              const SizedBox(height: 16),
              GetBuilder<HomeSliderController>(builder: (sliderController) {
                if (sliderController.inProgress) {
                  return const SizedBox(
                      height: 192, child: CenteredCircularProgressIndicator());
                }

                return HomeCarouselSlider(
                  sliders: sliderController.sliderModelList,
                );
              }),
              const SizedBox(height: 16),
              _buildSectionHeader(
                title: 'Categories',
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().moveToCategory();
                },
              ),
              _getCategoryList(),
              _buildSectionHeader(title: 'Popular', onTapSeeAll: () {}),
              _getPopularProducts(),
              _buildSectionHeader(title: 'Special', onTapSeeAll: () {}),
              _getSpecialProducts(),
              _buildSectionHeader(title: 'New', onTapSeeAll: () {}),
              _getNewProducts(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPopularProducts() {
    return GetBuilder<PopularProductController>(
        builder: (popularProductController) {
      return Visibility(
        visible: popularProductController.inProgress == false,
        replacement: const CenteredCircularProgressIndicator(),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 8,
            children: popularProductController.productModelList
                .map(
                  (product) => ProductCard(
                    productModel: product,
                  ),
                )
                .toList(),
          ),
        ),
      );
    });
  }

  Widget _getSpecialProducts() {
    return SizedBox(
      height: 185,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          // print('object');
          // return ProductCard(productModel: ,);
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 8);
        },
      ),
    );
  }

  Widget _getNewProducts() {
    return Row(
        //spacing: 8,
        // children: [1, 2, 3, 4].map((e) => ProductCard()).toList(),
        );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetPaths.navAppLogo),
      actions: [
        appBarIconButton(iconData: Icons.person, onTap: () {}),
        appBarIconButton(iconData: Icons.call, onTap: () {}),
        appBarIconButton(iconData: Icons.notifications, onTap: () {}),
      ],
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onTapSeeAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        TextButton(onPressed: onTapSeeAll, child: const Text('See all')),
      ],
    );
  }

  Widget _getCategoryList() {
    return SizedBox(
      height: 100,
      child: GetBuilder<CategoryListController>(builder: (controller) {
        if (controller.initialLoadingInProgress) {
          return const CenteredCircularProgressIndicator();
        }

        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.homeCategoryItemListLength,
          itemBuilder: (context, index) {
            return ProductCategoryItem(
              categoryModel: controller.categoryModelList[index],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 8),
        );
      }),
    );
  }

//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 16,
//               ),
//               productSearchBar(),
//               const SizedBox(
//                 height: 16,
//               ),
//               GetBuilder<HomeSliderController>(builder: (slidereController) {
//                 if (slidereController.inProgress) {
//                   return const SizedBox(
//                       child: CenteredCircularProgressIndicator());
//                 }
//                 return HomeCarouselSlider(
//                   sliders: slidereController.sliderModelList,
//                 );
//               }),
//               const SizedBox(
//                 height: 16,
//               ),
//               _buildSectionHeader(
//                   title: 'All Categories',
//                   onTapSeeAll: () {
//                     Get.find<MainBottomNavController>().moveToCategory();
//                   }),
//               //  const SizedBox(
//               //   height: 16,
//               // ),
//               _getCategoryList(),

//               _buildSectionHeader(title: 'Popular', onTapSeeAll: () {}),
//               _getPopularProducts(),

//               _buildSectionHeader(title: 'Special', onTapSeeAll: () {}),
//               _getSpecialProducts(),

//               _buildSectionHeader(title: 'New', onTapSeeAll: () {}),
//               _getNewProducts(),

//               const SizedBox(
//                 height: 8,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _getPopularProducts() {
//     return GetBuilder<PopularProductController>(
//         builder: (popularProductController) {
//       return Visibility(
//         visible: popularProductController.inProgress == false,
//         replacement: CenteredCircularProgressIndicator(),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             spacing: 8,
//             children: popularProductController.productModelList
//                 .map(
//                   (product) => ProductCard(
//                     productModel: product,
//                   ),
//                 )
//                 .toList(),
//           ),
//         ),
//       );
//     });
//   }

//   Widget _getSpecialProducts() {
//     //return ProductCard();
//     return SizedBox(
//       height: 185,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           // return ProductCard();
//         },
//         separatorBuilder: (context, index) {
//           return SizedBox(width: 8);
//         },
//       ),
//     );
//   }

//   Widget _getNewProducts() {
//     //return ProductCard();
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         spacing: 8,
//         // children: [1, 2, 3, 4].map((e) => ProductCard()).toList(),
//       ),
//     );
//   }

//   AppBar _buildAppBar() {
//     return AppBar(
//       title: SvgPicture.asset(AssetPaths.navAppLogo),
//       actions: [
//         appBarIconButton(
//           onTap: () {},
//           iconData: Icons.people,
//         ),
//         appBarIconButton(
//           onTap: () {},
//           iconData: Icons.phone,
//         ),
//         appBarIconButton(
//           onTap: () {},
//           iconData: Icons.notifications_active,
//         )
//       ],
//     );
//   }

//   Widget _buildSectionHeader(
//       {required String title, required VoidCallback onTapSeeAll}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//         TextButton(
//             onPressed: onTapSeeAll,
//             child: const Text(
//               'See All',
//             ))
//       ],
//     );
//   }

//   Widget _getCategoryList() {
//     return SizedBox(
//       height: 100,
//       child: GetBuilder<CategoryListController>(builder: (controller) {
//         if (controller.initialLoadingInProgress) {
//           const CenteredCircularProgressIndicator();
//         }
//         return ListView.separated(
//           scrollDirection: Axis.horizontal,
//           itemCount: controller.homeCategoryItemListLength,
//           itemBuilder: (context, index) {
//             return ProductCategoryItem(
//               categoryModel: controller.categoryModelList[index],
//             );
//           },
//           separatorBuilder: (context, index) => const SizedBox(
//             width: 8,
//           ),
//         );
//       }),
//     );
//   }
}
