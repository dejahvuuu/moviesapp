class ApiEndPoints {
  static final String baseUrl = 'http://10.0.2.2:9000/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
  static _MovieEndPoints movieEndpoints = _MovieEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'users/signup';
  final String loginEmail = 'users/login';
}

class _MovieEndPoints {
  final String getMovies = 'movies';
  final String createMovies = 'movies/createmovie';
}