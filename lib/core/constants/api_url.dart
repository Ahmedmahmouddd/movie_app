class ApiUrl {
  // Base Url and version
  static const baseUrl = 'https://90c8-156-210-125-140.ngrok-free.app/';
  static const apiVersion = 'api/v1/';

  // Auth
  static const signup = '${apiVersion}auth/signup';
  static const signin = '${apiVersion}auth/signin';

  // Movie
  static const trendingMovies = '${apiVersion}movie/trending';
  static const nowPlayingMovies = '${apiVersion}movie/nowplaying';
  static const movie = '${apiVersion}movie/';

  // TV
  static const popularTV = '${apiVersion}tv/popular';
  static const tv = '${apiVersion}tv/';

  // Trailer
  static const trailerBaseUrl = 'https://www.youtube.com/watch?v=';

  // Search
  static const searchMovie = '${apiVersion}search/movie';
  static const searchTv = '${apiVersion}search/tv';
}
