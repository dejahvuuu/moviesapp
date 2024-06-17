import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterapp/controllers/movies/movie_controller.dart';

class CreateMovieScreen extends StatefulWidget {
  @override
  State<CreateMovieScreen> createState() => _CreateMovieScreenState();
}

class _CreateMovieScreenState extends State<CreateMovieScreen> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final topicController = TextEditingController();
  final movieurlController = TextEditingController();
  final movieidController = TextEditingController();

  MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Movie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Movie Name'),
              ),
              TextFormField(
                controller: topicController,
                decoration: InputDecoration(labelText: 'Movie Topic'),
              ),
              TextFormField(
                controller: movieurlController,
                decoration: InputDecoration(labelText: 'Video URL'),
              ),
              TextFormField(
                controller: movieidController,
                decoration: InputDecoration(labelText: 'Movie ID'),
              ),              
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  String topic = topicController.text;
                  String movieUrl = movieurlController.text;
                  String movieId = movieidController.text;

                  movieController.createMovies(name, topic, movieUrl, movieId);
                },
                child: Text('Create Movie'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}