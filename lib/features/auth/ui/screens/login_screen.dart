import 'package:crafty_bay/features/auth/ui/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

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
                  ElevatedButton(
                  onPressed: _onTapLoginButton, 
                  child: Text('Login'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
    
  }
  
  void _onTapLoginButton(){
    Navigator.pushNamed(context, SignUpScreen.name);
    // if(_formkey.currentState!.validate()){
     
    // }
  }
 
}
