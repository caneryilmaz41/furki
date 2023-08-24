import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movie_model.dart';

class ApiService {
  Future<List<Movie>>fetchData() async {
    var url = Uri.parse('https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc');
    var headers = {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZjJlZGZkYTFkOTVkOGQzMGU3MTRiNDdkNjIxODM2OSIsInN1YiI6IjY0MzUxMjJkY2NhN2RlMDEyNjQxZDhmMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VqKaS3s2AlhitE5tHWT4X_hDOMCnaNGyyeobvEr5A1s',
      'accept': 'application/json',
    };

    var response = await http.get(url, headers: headers);
    
   
      var jsonResponse = jsonDecode(response.body);
      List<Movie>movies=[];
      for(var movieData in jsonResponse['results']){
        movies.add(Movie.fromJson(movieData));
      }
      return movies;
      
    
  }
}