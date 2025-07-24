import 'package:crafty_bay/core/ui/snack_bar_message.dart';
import 'package:crafty_bay/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/product/controllers/product_review_controller.dart';
import 'package:crafty_bay/features/product/data/models/product_review_model.dart';
import 'package:crafty_bay/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProductReviewScreen extends StatefulWidget {
  const CreateProductReviewScreen({super.key});
  static const String name = '/create_product_review';
  @override
  State<CreateProductReviewScreen> createState() =>
      _CreateProductReviewScreenState();
}

class _CreateProductReviewScreenState extends State<CreateProductReviewScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _writeReviewTEController =
      TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();

  final ProductReviewController _productReviewController =
      Get.find<ProductReviewController>();

  //final SignUpController _signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Review'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                    controller: _firstNameTEController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter a valid first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _lastNameTEController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'Last Name',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter a valid last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _writeReviewTEController,
                    textInputAction: TextInputAction.done,
                    maxLines: 9,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        hintText: 'Write a Review'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your full address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GetBuilder(
                      init: _productReviewController,
                      builder: (_) {
                        return Visibility(
                          visible: _productReviewController.inProgress == false,
                          replacement: const Center(
                            child: CenteredCircularProgressIndicator(),
                          ),
                          child: ElevatedButton(
                              onPressed: _onTapReviewSubmitButton,
                              child: Text('Submit')),
                        );
                      }),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapReviewSubmitButton() async {
    if (_formkey.currentState!.validate()) {
      final ProductReviewModel model = ProductReviewModel(
        productName: _firstNameTEController.text.trim(),
        comment: _lastNameTEController.text.trim(),
        rating: _writeReviewTEController.text.trim(),
      );
      final bool isSuccess =
          await _productReviewController.productReview(model);
      if (isSuccess) {
        //todo: app navigate to verify otp screen
        showSnackBarMessage(context, _productReviewController.message);
        Navigator.pushNamed(context, ProductDetailsScreen.name);
      } else {
        showSnackBarMessage(
            context, _productReviewController.errorMessage ?? 'Error', true);
      }
    }
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _writeReviewTEController.dispose();
    ;

    super.dispose();
  }
}
