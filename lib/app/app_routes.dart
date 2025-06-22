import 'package:crafty_bay/features/auth/ui/screens/login_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
     late final Widget screenWidget;

       if(settings.name == SplashScreen.name){
          screenWidget = const SplashScreen();
       }else if(settings.name == LoginScreen.name){
          screenWidget = const LoginScreen();
       }else if(settings.name == SignUpScreen.name){
          screenWidget = const SignUpScreen();
       }

       return MaterialPageRoute(builder: (context)=> screenWidget);
  }
}