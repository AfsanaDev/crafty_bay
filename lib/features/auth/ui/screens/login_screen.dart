
import 'package:crafty_bay/core/ui/snack_bar_message.dart';
import 'package:crafty_bay/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/auth/data/models/login_request_model.dart';
import 'package:crafty_bay/features/auth/ui/controller/login_controller.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:crafty_bay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static final name = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    
    final TextEditingController _emailTEController = TextEditingController();
    final TextEditingController _passwordTEController = TextEditingController();
    final GlobalKey<FormState> _formkey = GlobalKey();
    bool _isHiddenPassword = true;
    final LoginController _loginController = Get.find<LoginController>();
  
  @override

  Widget build(BuildContext context) {

     TextTheme textTheme = Theme.of(context).textTheme;
    
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const SizedBox(height: 44),
                  const AppLogo(
                    width: 90,
                    height: 90,
                  ),
                  const SizedBox(height: 16,),
                  Text(
                    'Welcome Back',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    'Please enter your email and password',
                    style: textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 24,),
                  TextFormField(
                    controller: _emailTEController ,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (String? value){
                      String emailValidator = value ?? '';
                      if(EmailValidator.validate(emailValidator)== false){
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _passwordTEController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                      icon: Icon(
                        _isHiddenPassword?Icons.visibility_off:
                        Icons.visibility),
                      onPressed: (){
                        setState(() {
                          _isHiddenPassword = !_isHiddenPassword;
                        });
                      },
                    ),
                    ),
                    obscureText: _isHiddenPassword,
                     
                    validator: (String? value){
                      if((value?.length ?? 0) <= 6){
                        return 'Enter a password more than 6 letters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8,),
                  GetBuilder(
                    init: LoginController(),
                    builder: (controller) {
                      return Visibility(
                        visible: controller.inProgress == false,
                        replacement: const CenteredCircularProgressIndicator(),
                        child: ElevatedButton(
                        onPressed: _onTapLoginButton, 
                        child: Text('Login')),
                      );
                    }
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    
  }
  
  void _onTapLoginButton() async{
    //Navigator.pushNamed(context, SignUpScreen.name);
    if(_formkey.currentState!.validate()){
      LoginRequestModel model = LoginRequestModel(email: _emailTEController.text, password: _passwordTEController.text);
       final bool isSuccess = await _loginController.login(model);

       if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(
            context, MainBottomNavScreen.name, (predicate) => false);
      } else {
        showSnackBarMessage(context, _loginController
            .errorMessage!, true);
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
 
}
