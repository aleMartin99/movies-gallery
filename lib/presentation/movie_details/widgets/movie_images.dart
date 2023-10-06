import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeberry_movies_test/core/constants/constants_exports.dart';
import 'package:codeberry_movies_test/domain/entities/entities_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieImages extends StatefulWidget {
  const MovieImages({
    Key? key,
    required this.movieDetails,
  }) : super(key: key);

  final MovieDetails movieDetails;

  @override
  State<MovieImages> createState() => _MovieImagesState();
}

class _MovieImagesState extends State<MovieImages> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context) / 100;
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
          ),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: baseImagelUrl + widget.movieDetails.backdrop,
                placeholder: (context, url) => Container(
                    color: Colors.transparent,
                    height: size.height * 25.5,
                    child: const CupertinoActivityIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Positioned(
                left: 25,
                top: 30,
                child: Align(
                  child: RawMaterialButton(
                    elevation: 0,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    onPressed: () async {
                      Navigator.pop(context);
                    },

                    fillColor: kPrimaryLightColor.withOpacity(
                      0.7,
                    ),
                    shape: const CircleBorder(),
                    constraints: const BoxConstraints.tightFor(
                      width: 35,
                      height: 35,
                    ), // .all(15),

                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 17,
                      color: Colors.black,
                    ),
                    // color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSmallMoviePreview(widget.movieDetails.poster),
          ],
        )
      ],
    );
  }

//int index
  Container buildSmallMoviePreview(String url) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(right: 15, top: 20),
      height: 80,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kPrimaryColor.withOpacity(1)),
      ),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: baseImagelUrl + widget.movieDetails.poster,
        placeholder: (context, url) => const CupertinoActivityIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
