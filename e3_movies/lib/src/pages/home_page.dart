import 'package:flutter/material.dart';

import 'package:e3_movies/src/search/search_delegate.dart';
import 'package:e3_movies/src/providers/movies_provider.dart';
import 'package:e3_movies/src/widgets/card_swiper_widget.dart';
import 'package:e3_movies/src/widgets/movie_horizontal.dart';


class HomePage extends StatelessWidget {

  final moviesProvider = MoviesProvider();

  @override
  Widget build(BuildContext context) {

    moviesProvider.getPopular();

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showSearch(context: context, delegate: DataSearch()),
          ),
        ],
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _cardSwiper(),
            _footer(context),
          ]
        ),
      )
    );
  }

  Widget _cardSwiper() {
    return FutureBuilder(
      future: moviesProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

        if (snapshot.hasData) {
          return CardSwiper(movies: snapshot.data);
        } else {
          return Container(
            height: 400,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }

        
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text('Populars', style: Theme.of(context).textTheme.subhead)
          ),
          SizedBox(height: 5),
          StreamBuilder(
            stream: moviesProvider.popularsStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) 
                return MovieHorizontal(
                  movies: snapshot.data,
                  nextPage: moviesProvider.getPopular
                );
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }

}