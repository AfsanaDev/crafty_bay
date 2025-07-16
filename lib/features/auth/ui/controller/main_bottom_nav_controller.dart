import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  int _currentIndex = 0;
  int get slectedIndex => _currentIndex;


  void changeIndex(int index){
    if( index == _currentIndex){
        return;
        
    }
    _currentIndex = index;
    update();
  }

  void moveToCategory(){
    changeIndex(1);
  }
  void backToHome(){
    changeIndex(0);
  }
}