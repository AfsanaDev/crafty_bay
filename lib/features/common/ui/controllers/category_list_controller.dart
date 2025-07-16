import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/common/models/category_model.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  final int _count = 30;

  int _currentPage = 0;
  int? _lastPage;

  bool _inProgress = false;

  bool _initialLoadingInProgress = false;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  bool get initialLoadingInProgress => _initialLoadingInProgress;

  final List<CategoryModel> _categoryModelList = [];

  List<CategoryModel> get categoryModelList => _categoryModelList;

  Future<void> getCategoryList() async {
    _currentPage++;
    if (_lastPage != null && _lastPage! < _currentPage) {
      return;
    }

    if (_currentPage == 1) {
      _categoryModelList.clear();
      _initialLoadingInProgress = true;
      update();
    } else {
      _inProgress = true;
    }

    update();
    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.categoryListUrl(_count, _currentPage),
    );
    if (response.isSuccess) {
      _lastPage = response.responseData!['data']['last_page'] ?? 0;
      List<CategoryModel> list = [];
      for (Map<String, dynamic> category in response.responseData!['data']
          ['results']) {
        list.add(CategoryModel.fromJson(category));
      }
      _categoryModelList.addAll(list);
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage!;
    }

    if (_currentPage == 1) {
      _initialLoadingInProgress = false;
      update();
    } else {
      _inProgress = false;
    }
    update();
  }
}
