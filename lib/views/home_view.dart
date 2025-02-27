import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/api.dart';
import 'package:movies_app/widgets/top_rated_list_view.dart';

import 'package:movies_app/widgets/trending_slider.dart';
import 'package:movies_app/widgets/upcoming_list_view.dart';


class HomeView extends StatefulWidget {
   const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}




class _HomeViewState extends State<HomeView> {

  late Future<List<MovieModel>> trendingMovies;
  late Future<List<MovieModel>> topRatedMovies;
  late Future<List<MovieModel>> upcomingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getRatedMovies();
    upcomingMovies = Api().upcomingMovies();

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'NETFLIX',
          style: TextStyle(
              fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        centerTitle: true,
      ) ,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Trending Movies',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30.0,),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final movies = snapshot.data!;
                      return TrendingSlider(snapshot: snapshot,);
                    }else if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()));
                    }else{
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }

                ),
              ),
              const SizedBox(height: 30.0,),
              const Text(
                'Top Rated Movies',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10.0,),
              // Top Rated Movies
              FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final movies = snapshot.data!;
                      return TopRatedListView(snapshot: snapshot,);
                    }else if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()));
                    }else{
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                  ),
              const SizedBox(height: 30.0,),
              const Text(
                'Upcoming Movies',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10.0,),
              // Upcoming Movies
              FutureBuilder(
                  future: upcomingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final movies = snapshot.data!;
                      return UpcomingListView(snapshot: snapshot,);
                    }else if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()));
                    }else{
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
              ),

            ],
          ),
        ),
      ),
    );
  }
}


