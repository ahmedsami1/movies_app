import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/movie_model.dart';

class OverviewView extends StatelessWidget {
  const OverviewView({super.key, required this.movie});

  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: CustomScrollView(

        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar.large(
            leading: const BackButton(),
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                child: Image.network(
                  filterQuality: FilterQuality.high,
                  '${Constants.imagePath}${movie.posterPath}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    'Overview',
                    style: TextStyle(fontSize: 28,
                        color: Colors.white,
                        fontWeight:FontWeight.w400),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    movie.overview,
                    style: const TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                            ),
                            child: Row(
                              children: [
                                const Text(
                                  'Release Date',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text(
                                    movie.releaseDate,
                                    style: const TextStyle(
                                      fontSize: 17,)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child:  Row(
                              children: [
                                const Text(
                                  'Rating',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                const Icon(Icons.star, color: Colors.amber,),
                                const SizedBox(width: 10,),
                                Text(
                                  movie.voteAverage.toString(),
                                  style: const TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


