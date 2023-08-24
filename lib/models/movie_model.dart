class Movie{
  String title;
  String description;
  String image;

  Movie({required this.title,required this.description,required this.image});

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      image: json['poster_path'],
      description: json['overview'],
      title: json['original_title'],
    );
  }

}