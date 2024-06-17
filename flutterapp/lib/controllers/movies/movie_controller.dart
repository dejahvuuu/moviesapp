import 'dart:convert';

import 'package:flutterapp/utils/api_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutterapp/models/movie_model.dart';

class MovieController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController topicController = TextEditingController();
  TextEditingController movieurlController = TextEditingController();
  TextEditingController movieidController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  getMovies() async {
    try {
      final SharedPreferences? prefs = await _prefs;
      var tokenJson = prefs?.get('token') as String?;
      var headers = {'Content-Type': 'application/json', 'token': tokenJson ?? ''};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.movieEndpoints.getMovies);

      http.Response response =
          await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        return MoviesResponse.fromJson(jsonMap);

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

  createMovies(String name, String topic, String movieUrl, String movieId) async {
    final SharedPreferences? prefs = await _prefs;
    var tokenJson = prefs?.get('token') as String?;
    var headers = {'Content-Type': 'application/json', 'token': tokenJson ?? ''};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.movieEndpoints.createMovies);
      Map body = {
        'name': nameController.text,
        'topic': topicController.text,
        'movie_url': movieurlController.text,
        'movie_id': movieidController.text,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);


      if (response.statusCode == 201) {
        final json = jsonDecode(response.body);
        var token = json['token'];
        final SharedPreferences? prefs = await _prefs;
        await prefs?.setString('token', token);

        nameController.clear();
        topicController.clear();
        movieurlController.clear();
        movieidController.clear();
        //Get.off(HomeScreen());
        Get.back();

      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured 1";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }
}
