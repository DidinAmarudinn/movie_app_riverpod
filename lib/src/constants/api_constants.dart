const String apiKey = 'api_key=4d0ccd6514e075265a88c931f89cc2a3';
const String baseUrl = 'https://api.themoviedb.org/3';

const String popularMovieUrl = "$baseUrl/movie/popular?$apiKey&page=";
const String upcomingMovieUrl = "$baseUrl/movie/upcoming?$apiKey&page=";
const String topRatedMovieUrl = "$baseUrl/movie/top_rated?$apiKey&page=";
const String nowPlayingMovieUrl = "$baseUrl/movie/now_playing?$apiKey&page=";
const String latestMovieUrl = "$baseUrl/movie/latest?$apiKey&page=";
const String detailMovieUrl = "$baseUrl/movie";
const String simmiliarsMovieUrl = "$baseUrl/movie/";
const String trandingMovieUrl = "$baseUrl/trending/movie/week?$apiKey";
const String genresMovieUrl = "$baseUrl/genre/movie/list?$apiKey";
const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
const String baseImageUrlOriginal = 'https://image.tmdb.org/t/p/original';
const String getMovieByGenreUrl = "$baseUrl/discover/movie?$apiKey&with_genres=";
const String getMovieTrailerUrl = "$baseUrl/movie/";
const String searchMovieUrl = "$baseUrl/search/movie?$apiKey&query=";
String getImageUrl(String? path) {
  return "$baseImageUrl$path";
}

String getOriginalImageUrl(String? path) {
  return "$baseImageUrlOriginal$path";
}
