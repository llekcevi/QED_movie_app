import 'package:flutter/material.dart';

class Movie {
  String title = '';
  String plot = '';
  String poster = '';

  Movie(this.title, this.plot, this.poster);

  Movie.fromJson(Map<String, String> jsonMovie) {
    title = jsonMovie['Title'].toString();
    plot = jsonMovie['Plot'].toString();
    poster = jsonMovie['Poster'].toString();
  }
}

void main() {
  runApp(const MovieApp());
}

Map<String, String> firstMovie = {
  "Title": "Dog",
  "Year": "2022",
  "Genre": "Comedy, Drama",
  "Plot":
      "Two former Army Rangers are paired against their will on the road trip of a lifetime. Briggs (Channing Tatum) and Lulu (a Belgian Malinois) race down the Pacific Coast to get to a fellow soldier's funeral on time.",
  "Poster":
      "https://m.media-amazon.com/images/M/MV5BYjA2MDM2YjctYzNhNC00NGEzLWFmYWEtODExODFkNmUyOGE2XkEyXkFqcGdeQXVyODk2NDQ3MTA@._V1_SX300.jpg",
  "imdbRating": "6.5",
  "Type": "movie",
};

List<Map<String, String>> jsonMovies = [
  {
    "Title": "Dog",
    "Year": "2022",
    "Genre": "Comedy, Drama",
    "Plot":
        "Two former Army Rangers are paired against their will on the road trip of a lifetime. Briggs (Channing Tatum) and Lulu (a Belgian Malinois) race down the Pacific Coast to get to a fellow soldier's funeral on time.",
    "Poster":
        "https://m.media-amazon.com/images/M/MV5BYjA2MDM2YjctYzNhNC00NGEzLWFmYWEtODExODFkNmUyOGE2XkEyXkFqcGdeQXVyODk2NDQ3MTA@._V1_SX300.jpg",
    "imdbRating": "6.5",
    "Type": "movie",
  },
  {
    "Title": "Dogs",
    "Year": "2016",
    "Genre": "Drama, Thriller",
    "Plot":
        "Roman returns to the land he has just inherited from his grandfather. Fully decided to sell this vast but desolate property, he is warned by the local cop that his grandfather was a local crime lord and his men will not let go of the",
    "Poster":
        "https://m.media-amazon.com/images/M/MV5BYWJiYjI1MzEtMzQzOS00ZjkxLWI3NDAtMzNkODhjYjM0Y2ExXkEyXkFqcGdeQXVyNDkzNTM2ODg@._V1_SX300.jpg",
    "imdbRating": "7.1",
    "Type": "movie",
  },
  {
    "Title": "Toy Story",
    "Year": "1995",
    "Genre": "Animation, Adventure, Comedy",
    "Plot":
        "A cowboy doll is profoundly threatened and jealous when a new spaceman figure supplants him as top toy in a boy's room.",
    "Poster":
        "https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_SX300.jpg",
    "imdbRating": "8.3",
    "Type": "movie",
  }
];

List<Movie> formattedMovies =
    jsonMovies.map((element) => Movie.fromJson(element)).toList();

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = Movie.fromJson(firstMovie);

    final ThemeData theme = ThemeData(); //dark
    // TODO: Apply Home widget
    // 3
    return MaterialApp(
      // TODO: Add theme
      title: 'Movies',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.black,
          secondary: Colors.blue,
        ),
      ),
      home: Scaffold(
        // TODO: Style the title
        appBar: AppBar(title: const Text('Movies')),
        // TODO: Style the body text
        body: SafeArea(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: formattedMovies.length,
              itemBuilder: (BuildContext context, int index) {
                return verticalContainer(context, index);
              }),
        ),
      ),
    );
  }

  Container horizontalContainer(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Container(
          height: 110,
          child: Row(children: [
            Image.network(formattedMovies[index].poster),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(formattedMovies[index].title,
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(formattedMovies[index].plot,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 3)
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Container verticalContainer(BuildContext context, int index) {
  return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(formattedMovies[index].poster)),
              const SizedBox(height: 10),
              Text(formattedMovies[index].title,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(formattedMovies[index].plot,
                  overflow: TextOverflow.ellipsis, softWrap: false, maxLines: 3)
            ],
          ),
        ),
      ));
}
 
