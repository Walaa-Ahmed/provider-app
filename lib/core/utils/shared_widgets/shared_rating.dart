import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../constants/app_color.dart';

class SharedRating extends StatelessWidget {
  const SharedRating(
      {Key? key,
      required this.initialRating,
      required this.itemCount,
      required this.itemSize})
      : super(key: key);
  final double initialRating;
  final int itemCount;
  final double itemSize;
  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: initialRating,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: itemCount,
      ratingWidget: RatingWidget(
        full:
            //Image.asset("assets/images/star.png"),
            Icon(Icons.star, color: Colors.amber),
        half:
            //Image.asset("assets/images/star.png"),
            const Icon(Icons.star_half, color: Colors.amber),
        empty:
            //Image.asset("assets/images/star.png"),
            const Icon(Icons.star_border, color: Colors.amber),
      ),
      itemSize: itemSize,
      itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
      onRatingUpdate: (rating) {
        ////////////////////////
      },
    );
  }
}
