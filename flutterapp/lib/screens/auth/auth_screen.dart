import 'package:flutterapp/controllers/auth/login_controller.dart';
import 'package:flutterapp/controllers/auth/registration_controller.dart';
import 'package:flutterapp/screens/auth/widgets/input_fields.dart';
import 'package:flutterapp/screens/auth/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  RegistrationController registrationController =
      Get.put(RegistrationController());

  LoginController loginController = Get.put(LoginController());

  var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(36),
          child: Center(
            child: Obx(
              () => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Text(
                        'Welcome to MovieApp',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 45, 6, 105),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          color: !isLogin.value ? Colors.white : Color.fromARGB(255, 221, 197, 255),
                          onPressed: () {
                            isLogin.value = false;
                          },
                          child: Text('Register'),
                        ),
                        MaterialButton(
                          color: isLogin.value ? Colors.white : Color.fromARGB(255, 221, 197, 255),
                          onPressed: () {
                            isLogin.value = true;
                          },
                          child: Text('Login'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    isLogin.value ? loginWidget() : registerWidget()
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget registerWidget() {
    return Column(
      children: [
        InputTextFieldWidget(registrationController.nameController, 'name'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(registrationController.usernameController, 'username'),
        SizedBox(
          height: 20,
        ),        
        InputTextFieldWidget(
            registrationController.emailController, 'email address'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
            registrationController.passwordController, 'password'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
            registrationController.usertypeController, 'user type'),
        SizedBox(
          height: 20,
        ),        
        SubmitButton(
          onPressed: () => registrationController.registerWithEmail(),
          title: 'Register',
        )
      ],
    );
  }

  Widget loginWidget() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(loginController.emailController, 'email address'),
        SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(loginController.passwordController, 'password'),
        SizedBox(
          height: 20,
        ),
        SubmitButton(
          onPressed: () => loginController.loginWithEmail(),
          title: 'Login',
        )
      ],
    );
  }
}