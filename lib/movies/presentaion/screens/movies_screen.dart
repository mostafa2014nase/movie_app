import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/app_constants.dart';
import 'package:movies_app/movies/presentaion/componentes/some_components_widgets.dart';
import 'package:movies_app/movies/presentaion/controller/riverpod.dart';

class MoviesScreen extends ConsumerWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final getMoviesProvider = ref.watch(getAllMovies);
    print(getMoviesProvider.movies);

    return Scaffold(
      body: SafeArea(
        
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            Expanded(
              child: GridView.builder(
                key: UniqueKey(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 0.01,
                  childAspectRatio: 2,
                  crossAxisCount: 1,
                ),
                physics: BouncingScrollPhysics(),
                shrinkWrap: false,
                itemCount: getMoviesProvider.movies.length,
                padding: EdgeInsets.all(5.0),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(children: [
                                Stack(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    // child: CustomImage(
                                    //   image: AppConstants.getImagePath(getMoviesProvider.movies[index].backdropPath),
                                    //   height:  65,
                                    //   width:  80,
                                    //   fit: BoxFit.cover,
                                    // ),
                                    child: Image.network(
                                      AppConstants.getImagePath(
                                          getMoviesProvider.movies[index].backdropPath),
                                        height:  170,
                                        width:  150,
                                        fit: BoxFit.cover,
                                    ),
                                  ),
                                ]),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          getMoviesProvider.movies[index].title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),
                                        ),
                                        SizedBox(height: 3.0,),
                                        Text(
                                          getMoviesProvider.movies[index].overview,
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 7.0,),
                                        RatingBar(
                                          rating: 10.0,
                                          size: 15,
                                          ratingCount: getMoviesProvider
                                              .movies[index].voteAverage,
                                        ),
                                        SizedBox(height: 7.0,),
                                        Container(
                                          decoration: BoxDecoration(
                                            color:Colors.orange,
                                            borderRadius: BorderRadius.circular(15.0),
                                            border: Border.all(
                                              color: Colors.orange,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(getMoviesProvider.movies[index].releaseDate,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 12.0),),
                                          ),
                                        )
                                      ]),
                                ),
                              ]),
                            )),
                            Padding(
                              padding: const EdgeInsets.only(left: 90),
                              child: Divider(
                                  color: index == getMoviesProvider.movies.length - 1
                                      ? Colors.transparent
                                      : Theme.of(context).disabledColor),
                            ),
                          ]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
