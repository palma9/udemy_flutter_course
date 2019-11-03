import 'package:flutter/material.dart';

import 'package:e3_movies/src/models/actor_model.dart';
import 'package:e3_movies/src/models/movie_model.dart';
import 'package:e3_movies/src/providers/movies_provider.dart';


class MovieDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
       body: Center(
         child: CustomScrollView(
           slivers: <Widget>[
              _makeAppbar(movie),
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 10),
                  _posterTitle(context, movie),
                  _description(movie),
                  _makeCasting(movie)
                ]),
              ),
           ],
         )
       ),
    );
  }

  Widget _makeAppbar(Movie movie) {
    return SliverAppBar(
      elevation: 2,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(movie.title),
        centerTitle: true,
        background: FadeInImage(
          image: NetworkImage(movie.getHorizontalPosterUrl()),
          placeholder: AssetImage('assets/img/loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitle(BuildContext context, Movie movie) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Hero(
            tag: movie.uuid,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(movie.getPosterUrl()),
                height: 150,
              ),
            ),
          ),
          SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.title,
                  overflow: TextOverflow.ellipsis
                ),
                Text(
                  movie.originalTitle,
                  style: Theme.of(context).textTheme.subhead,
                  overflow: TextOverflow.ellipsis
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_border),
                    Text(
                      movie.voteAverage.toString(),
                      style: Theme.of(context).textTheme.subhead
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _description(Movie movie) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _makeCasting(Movie movie) { 
    final moviesProvider = new MoviesProvider();

    return FutureBuilder(
      future: moviesProvider.getMovieCast('${movie.id}'),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData)
          return _makeActorsPageView(snapshot.data);
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _makeActorsPageView(List<Actor> actors) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        pageSnapping: false,
        itemCount: actors.length,
        controller: PageController(
          viewportFraction: 0.25,
          initialPage: 1
        ),
        itemBuilder: (context, item) {
          return _actorCard(actors[item]);
        },
      ),
    ); 
  }

  Widget _actorCard(Actor actor) {
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              image: NetworkImage(actor.getPhoto()),
              placeholder: AssetImage('assets/img/no-image.jpg'),
              fit: BoxFit.cover,
              height: 150,
            ),
          ),
          Text(actor.name, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}