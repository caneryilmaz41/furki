import 'package:flutter/material.dart';
import 'package:movidedb/models/movie_model.dart';
import 'package:movidedb/services/api_services.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
ApiService _apiService=ApiService();
List<Movie> movies = [];
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      body:Center(
        child:FutureBuilder<List<Movie>>(
          builder:(context, snapshot) {

            if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            else if(snapshot.hasData){
              movies=snapshot.data!;
              return ListView.builder(
                itemCount:movies.length,
                itemBuilder: (context, index) {
                
                Movie movie=movies[index];
                return ListTile(
                  trailing:Image.network('http://image.tmdb.org/t/p/w185/'+movie.image),
                  title: Text(movie.title),
                  subtitle:Text(movie.description),
                );
              },);
            }else{
              return CircularProgressIndicator();
            }
          },
          future:_apiService.fetchData(),
        )
      )
    );
  }
}