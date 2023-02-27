import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRating{

  static ratingBar(
      {double initialRating = 3, double iconSize = 7, Axis direction = Axis.horizontal, required Function(double) onRatingUpdate,
      double itemSize = 15,
      }){
    return RatingBar.builder(
      initialRating: initialRating,
      minRating: 1,
      direction: direction,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: itemSize,
      // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
        // size: iconSize.h,
      ),
      onRatingUpdate: onRatingUpdate,
    );
  }
}