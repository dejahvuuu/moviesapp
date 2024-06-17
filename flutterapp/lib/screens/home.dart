import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/auth_screen.dart';
import 'package:flutterapp/controllers/movies/movie_controller.dart';
import 'package:flutterapp/models/movie_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'create_movie.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late MovieController movieController;
  MoviesResponse? moviesResponse;

  @override
  void initState() {
    super.initState();
    movieController = Get.put(MovieController());
    fetchMovies();
  }

  void fetchMovies() async {
    MoviesResponse fetchedMovies = await movieController.getMovies();
    setState(() {
      moviesResponse = fetchedMovies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.movie),
        title: Text("MoviesApp"),
        actions: [
        TextButton(
            onPressed: () async {
              final SharedPreferences? prefs = await _prefs;
              prefs?.clear();
              Get.offAll(AuthScreen());
            },
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.red)),
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            )
        )
      ]),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateMovieScreen()); 
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: moviesResponse != null
            ? Column(
                children: moviesResponse!.movieItems.map((movie) => MovieTile(movie: movie)).toList(),
              )
            : Center(
                child: CircularProgressIndicator(),  
              ),
      ),
    );
  }
}

class MovieTile extends StatelessWidget {
  final MovieItem movie;

  MovieTile({required this.movie});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(movie.movieUrl) ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(movie.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Topic: ${movie.topic}"),
                Text("Movie ID: ${movie.movieId}"),
              ],
            ),
          ),
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
