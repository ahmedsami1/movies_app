import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/views/overview_view.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index, realIndex) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) =>  OverviewView(movie: snapshot.data[index] ,),));
            },
            child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: SizedBox(
                        width: 200,
                        height: 300,
                        child: Image.network(
                          filterQuality: FilterQuality.high,
                          '${Constants.imagePath}${snapshot.data[index].posterPath}',
                          fit: BoxFit.cover,

                        ),
                      )
                  )
                ]
            ),
          );
        },
        options: CarouselOptions(
          aspectRatio: 1.5,
          height: 450,
          viewportFraction: 0.52,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(seconds: 1),

        )
    );
  }
}
