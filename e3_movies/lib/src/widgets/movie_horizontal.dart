import 'package:flutter/material.dart';

import 'package:e3_movies/src/models/movie_model.dart';


class MovieHorizontal extends StatelessWidget {

  final List<Movie> movies;
  final Function nextPage;

  MovieHorizontal({@required this.movies, @required this.nextPage});

  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.25
  );

  @override
  Widget build(BuildContext context) {
    
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >= _pageController.position.maxScrollExtent-200) {
        nextPage();
      }
    });

    return Container(
      height: _screenSize.height*0.2,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: movies.length,
        itemBuilder: (context, index) => _card(context, movies[index]),
      ),
    );
  }
  
  Widget _card(BuildContext context, Movie movie) {
    movie.uuid = '${movie.id}_horizontal';

    final card = Container(
        margin: EdgeInsets.only(right: 15),
        child: Column(
          children: <Widget>[
            Hero(
              tag: movie.uuid,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FadeInImage(
                  image: NetworkImage(movie.getPosterUrl()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: 155,
                ),
              ),
            ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            child: Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          ],
        ),
      );

      return GestureDetector(
        child: card,
        onTap: () => Navigator.pushNamed(context, 'movie_detail', arguments: movie),
      );
  }
 
}