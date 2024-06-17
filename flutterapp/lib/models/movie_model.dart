import 'dart:convert';

class MovieItem {
  final String id;
  final String createdAt;
  final String movieId;
  final String movieUrl;
  final String name;
  final String topic;
  final String updatedAt;

  MovieItem({
    required this.id,
    required this.createdAt,
    required this.movieId,
    required this.movieUrl,
    required this.name,
    required this.topic,
    required this.updatedAt,
  });

  factory MovieItem.fromJson(Map<String, dynamic> json) {
    return MovieItem(
      id: json['_id'],
      createdAt: json['created_at'],
      movieId: json['movie_id'],
      movieUrl: json['movie_url'],
      name: json['name'],
      topic: json['topic'],
      updatedAt: json['updated_at'],
    );
  }
}

class MoviesResponse {
  final List<MovieItem> movieItems;
  final int totalCount;

  MoviesResponse({
    required this.movieItems,
    required this.totalCount,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) {
    var list = json['movie_items'] as List;
    List<MovieItem> movieItemsList = list.map((i) => MovieItem.fromJson(i)).toList();

    return MoviesResponse(
      movieItems: movieItemsList,
      totalCount: json['total_count'],
    );
  }
}
