import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:e3_movies/src/models/movie_model.dart';


class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

  CardSwiper({ @required this.movies });

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.6,
        itemCount: movies.length,
        autoplay: true,
        autoplayDelay: 10000,
        duration: 1000,
        itemBuilder: (BuildContext context,int index){
          movies[index].uuid = '${movies[index].id}_swiper';
          return Hero(
            tag: movies[index].uuid,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'movie_detail', arguments: movies[index]),
                child: FadeInImage(
                  image: NetworkImage(movies[index].getPosterUrl()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );           
        },
      ),
    );
  }
}