import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/product/data/models/product_review_model.dart';
import 'package:get/get.dart';

class ProductReviewController extends GetxController {
  bool _inProgress = false;

  String? _errorMessage;
  late String _message;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  String get message => _message;

  Future<bool> productReview(ProductReviewModel model) async {
    bool isSUccess = false;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>()
        .postRequest(Urls.getReviewListUrl, body: model.toJson());

    if (response.isSuccess) {
      _message = response.responseData!['msg'];
      isSUccess = true;
      _errorMessage = null;
    } else {
      _message = response.errorMessage!;
    }

    _inProgress = false;
    update();
    return isSUccess;
  }
}
