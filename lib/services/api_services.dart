import 'dart:convert';
import 'dart:math';

import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/models/upcoming_model.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.themoviedb.org/3/";
var key = '?api_key=$apiKey';
late String endPoint;

class ApiServices {
  Future<UpcomingMovieModel> getUpcomingMovies() async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // log(response);
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load upcoming movies');
  }

  Future<UpcomingMovieModel> getNowPlayingMovies() async {
    endPoint = "movie/now_playing";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print(response);
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load now playing movies');
  }

  Future<TvSeriesModel> getTopRatedSeries() async {
    endPoint = "tv/top_rated";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print(response);
      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load top rated tv series');
  }

  Future<TvSeriesModel> getSearchedMovie(String searchText) async {
    endPoint = "search/movie?query=$searchText";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print(response);
      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load top rated tv series');
  }
}
