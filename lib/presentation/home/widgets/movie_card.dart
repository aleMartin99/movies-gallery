import 'package:codeberry_movies_test/core/constants/constants_exports.dart';
import 'package:codeberry_movies_test/core/router/app_router.dart';
import 'package:codeberry_movies_test/core/router/routes.dart';
import 'package:codeberry_movies_test/domain/entities/entities_exports.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context) / 100;
    return SizedBox(
      // width: size.width * 7,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          AppRoutes.movieDetailsRoute,
          arguments: MovieDetailsArguments(movieId: widget.movie.id),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Hero(
                  tag: widget.movie.id.toString(),
                  child: widget.movie.poster.isEmpty
                      ? const Placeholder()
                      : CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: baseImagelUrl + widget.movie.poster,
                          placeholder: (context, url) =>
                              const CupertinoActivityIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.movie.title,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(4),
                        height: 25,
                        width: 25,
                        child: const Icon(
                          CupertinoIcons.heart_solid,
                          size: 15,
                          color: Color(0xFFFF4848),
                        )),
                    Text(
                      "${widget.movie.voteCount}",
                      style: const TextStyle(
                        // fontSize: ,
                        fontWeight: FontWeight.w600,
                        color: kGreyTextColor,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(4),
                        height: 25,
                        width: 25,
                        child: const Icon(
                          CupertinoIcons.star_lefthalf_fill,
                          size: 16,
                          color: Colors.amberAccent,
                        )),
                    Text(
                      "\$${widget.movie.voteAverage}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kGreyTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
