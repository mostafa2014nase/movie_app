class AppConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "d89093b8140a8f86007c2c05e6b2b753";
  static const String getMoviesPath = "$baseUrl/movie/popular?api_key=$apiKey";
  static const String baseImagesUrl = "https://image.tmdb.org/t/p/w500";

  static  String getImagePath (String imagePath) => "$baseImagesUrl$imagePath";

}

class Images{
  static const String placeholder = "assets/image/placeholder.jpg";
}