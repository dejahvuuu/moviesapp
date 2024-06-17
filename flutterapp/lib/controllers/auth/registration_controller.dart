import 'dart:convert';

import 'package:flutterapp/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usertypeController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail);
      Map body = {
        'name': nameController.text,
        'username': usernameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text,
        'user_type': usertypeController.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 201) {
          //final json = jsonDecode(response.body);
          nameController.clear();
          usernameController.clear();
          emailController.clear();
          passwordController.clear();
          usertypeController.clear();
          //Get.off(HomeScreen());

          // Show message success register
                
          showDialog(
            context: Get.context!,
            builder: (context) {
              return SimpleDialog(
                title: Text('Registration successful'),
                contentPadding: EdgeInsets.all(20),
                children: [Text('Now go to the login tab and login with the email and password you just entered.')],
              );
            }
          );

      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (e) {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text('Error'),
            contentPadding: EdgeInsets.all(20),
            children: [Text(e.toString())],
          );
        }
      );
    }
  }
}