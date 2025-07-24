import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/auth/data/models/login_request_model.dart';
import 'package:crafty_bay/features/common/models/user_model.dart';
import 'package:crafty_bay/features/common/ui/controllers/auth_controller.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //loading state

  bool _inProgress =false;

  String? _errorMessage;
  

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
 

  Future<bool> login(LoginRequestModel model)async{
    bool isSUccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>().postRequest(Urls.loginpUrl, body: model.toJson());

    if(response.isSuccess){
      Get.find<AuthController>().saveUserData(
      response.responseData!['data']['token'], UserModel.fromJson(response.responseData!['data']['user']));
      isSUccess = true;
      _errorMessage = null;
    }else{
      _errorMessage = response.errorMessage!;
    }

    _inProgress = false;
    update();
    return isSUccess;
  }
}