import 'package:e3_movies/src/models/movie_model.dart';
import 'package:e3_movies/src/providers/movies_provider.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {

  String selected  = '';

  final moviesProvider = new MoviesProvider();

  final movies = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Superman',
    'Ironman',
    'Captain America',
    'Thor'
  ];

  final recentMovies = [
    'Spiderman',
    'Captain America'
  ];
  
  @override
  List<Widget> buildActions(BuildContext context) {
    /* Appbar actions when is active */
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    /* Icon to the right of appbar */
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    /* Make results shown */
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    /* Suggestions that appears when is writing */

    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: moviesProvider.searchMovie(query),
      // initialData: ,
      builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          final movies = snapshot.data;
          return ListView(
            children: movies.map((m) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(m.getPosterUrl()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  width: 50,
                  fit: BoxFit.contain,
                ),
                title: Text(m.title),
                subtitle: Text(m.originalTitle),
                onTap: () {
                  close(context, null);
                  m.uuid = '${m.id}_search';
                  Navigator.pushNamed(context, 'movie_detail', arguments: m);

                },
              );
            }).toList(),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  


  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   /* Suggestions that appears when is writing */
  //
  //   final searchedMovie = movies.where((m) => m.toLowerCase().contains(query.toLowerCase())).toList();
  //   final suggestedMovies = query.isEmpty ? recentMovies : searchedMovie;
  //  
  //   return ListView.builder(
  //     itemCount: suggestedMovies.length,
  //     itemBuilder: (context, i) {
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(suggestedMovies[i]),
  //         onTap: () {
  //           selected = suggestedMovies[i];
  //           showResults(context);
  //         }
  //       );
  //     },
  //   );
  // }

  
}