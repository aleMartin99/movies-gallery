import 'package:cached_network_image/cached_network_image.dart';
import 'package:codeberry_movies_test/core/constants/constants_exports.dart';
import 'package:codeberry_movies_test/core/constants/extra.dart';
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
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 230,
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.movieDetails.id.toString(),
              child: CachedNetworkImage(
                //TODO add other image background
                // imageUrl: widget.movie.images![selectedImage],
                imageUrl: baseImagelUrl + widget.movieDetails.poster,
                placeholder: (context, url) =>
                    const CupertinoActivityIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSmallProductPreview(widget.movieDetails.poster),
            //TODO add other image background

            // ...List.generate(widget.product.images!.length,
            //     (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

//int index
  GestureDetector buildSmallProductPreview(String url) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kPrimaryColor.withOpacity(1)),
          // color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
//TODO image check gallery
          // imageUrl: widget.movie.images![index],
          imageUrl: baseImagelUrl + widget.movieDetails.poster,
          placeholder: (context, url) => const CupertinoActivityIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
