import 'package:crafty_bay/core/ui/snack_bar_message.dart';
import 'package:crafty_bay/core/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/auth/data/models/sign_up_request_model.dart';
import 'package:crafty_bay/features/auth/ui/controller/sign_up_controller.dart';
import 'package:crafty_bay/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static final name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
    
    final TextEditingController _emailTEController = TextEditingController();
    final TextEditingController _passwordTEController = TextEditingController();
    final TextEditingController _firstNameTEController = TextEditingController();
    final TextEditingController _lastNameTEController = TextEditingController();
    final TextEditingController _mobileTEController = TextEditingController();
    final TextEditingController _cityTEController = TextEditingController();
    final TextEditingController _shippingAddressTEController = TextEditingController();
    final GlobalKey<FormState> _formkey = GlobalKey();

    final SignUpController _signUpController = Get.find<SignUpController>();
    
  
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
                  const AppLogo(
                    width: 90,
                    height: 90,
                  ),
                  const SizedBox(height: 16,),
                  Text(
                    'Register Account',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    'Please enter your details to sign up',
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
                    controller: _firstNameTEController ,
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
                  const SizedBox(height: 8,),TextFormField(
                    controller: _lastNameTEController ,
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
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _mobileTEController ,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'Mobile',
                    ),
                    validator: (String? value) {
                      String phone = value?.trim() ?? '';
                      RegExp regExp = RegExp(r"^(?:\+?88|0088)?01[15-9]\d{8}$");
                      if (regExp.hasMatch(phone) == false) {
                        return 'Enter your valid phone number';
                      }
                      return null;
                    },
                  ),
                   const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Password'),
                    validator: (String? value) {
                      if ((value?.length ?? 0) <= 6) {
                        return 'Enter a password more than 6 letters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: _cityTEController ,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'City',
                    ),
                   validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your city name';
                      }
                      return null;
                    }, 
                  ),
                  const SizedBox(height: 8,),
                    TextFormField(
                    controller: _shippingAddressTEController,
                    textInputAction: TextInputAction.done,
                    maxLines: 3,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        hintText: 'Shipping Address'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your full address';
                      }
                      return null;
                    },
                  ),
                 
                  const SizedBox(height: 8,),
                  GetBuilder<SignUpController>(
                    builder: (_) {
                      return Visibility(
                        visible: _signUpController.inProgress == false,
                        replacement: const Center(
                          child:  CenteredCircularProgressIndicator()),
                        child: ElevatedButton(
                        onPressed: _onTapSignUpButton, 
                        child: Text('Sign Up')),
                      );
                    }
                  ),
                  const SizedBox(height: 32,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    
  }
  
  Future<void> _onTapSignUpButton() async {
    if(_formkey.currentState!.validate()){
     final SignUpRequestModel model = SignUpRequestModel(
      firstName: _firstNameTEController.text.trim(), 
      lastName: _lastNameTEController.text.trim(),
       email: _emailTEController.text.trim(), 
       password: _passwordTEController.text, 
       phone: _passwordTEController.text.trim(),
        city: _cityTEController.text.trim());
       final bool isSuccess = await _signUpController.signUp(model);
       if(isSuccess){
          //todo: app navigate to verify otp screen
           showSnackBarMessage(context, _signUpController.message);
          Navigator.pushNamed(context, VerifyOtpScreen.name,
           arguments: _emailTEController.text.trim());
          
       }else{
         showSnackBarMessage(context,_signUpController.errorMessage?? 'Error', true);
       }
    }
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _emailTEController.dispose();
    _cityTEController.dispose();
    _shippingAddressTEController.dispose();
    _passwordTEController.dispose();
    
    super.dispose();
  }
 
}


