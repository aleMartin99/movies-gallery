import 'package:codeberry_movies_test/core/constants/constants_exports.dart';
import 'package:codeberry_movies_test/domain/entities/entities_exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDescription extends StatefulWidget {
  const MovieDescription({
    Key? key,
    required this.movieDetails,
  }) : super(key: key);

  final MovieDetails movieDetails;

  @override
  State<MovieDescription> createState() => _MovieDescriptionState();
}

class _MovieDescriptionState extends State<MovieDescription> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context) / 100;
    String productionCompanies =
        widget.movieDetails.productionCompanies.join(' -');
    String genres = widget.movieDetails.genres.join(' -');
    String spokenLanguages = widget.movieDetails.spokenLanguages.join(' -');
    String productionCountries =
        widget.movieDetails.productionCountries.join(' -');
    return SizedBox(
      height: size.height * 44,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 50,
                    child: Text(
                      widget.movieDetails.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 21),
                    ),
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 14),
                          child: Row(
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
                                "${widget.movieDetails.voteCount}",
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
                                "\$${widget.movieDetails.voteAverage}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: kGreyTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Text(
                '"${widget.movieDetails.tagline}"',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontStyle: FontStyle.italic),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 12, bottom: 12),
                  child: Text(
                    widget.movieDetails.releaseDate,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    '/ ${widget.movieDetails.status}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Text(
                widget.movieDetails.overview,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w400),
                // maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.watch_later_outlined,
                      size: 17, color: kGreyTextColor),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(
                      '${widget.movieDetails.runtime} min',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: kGreyTextColor),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 6,
                left: 20,
              ),
              child: SizedBox(
                width: size.width * 90,
                child: Row(
                  children: [
                    const Icon(Icons.theater_comedy,
                        size: 17, color: kGreyTextColor),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          genres,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kGreyTextColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 6,
                left: 20,
              ),
              child: SizedBox(
                width: size.width * 90,
                child: Row(
                  children: [
                    const Icon(Icons.language_rounded,
                        size: 16, color: kGreyTextColor),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          spokenLanguages,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kGreyTextColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 6,
                left: 20,
              ),
              child: SizedBox(
                width: size.width * 90,
                child: Row(
                  children: [
                    const Icon(Icons.flag, size: 16, color: kGreyTextColor),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          productionCountries,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kGreyTextColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 20, bottom: 30),
              child: SizedBox(
                width: size.width * 90,
                child: Row(
                  children: [
                    const Icon(
                      Icons.maps_home_work_outlined,
                      size: 17,
                      color: kGreyTextColor,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          productionCompanies,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kGreyTextColor),
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                'Revenue: \$${widget.movieDetails.revenue}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: kGreyTextColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 7, bottom: 20),
              child: Text(
                'Budget: \$${widget.movieDetails.budget}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: kGreyTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
