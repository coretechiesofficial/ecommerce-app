import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'categories.dart';
import 'offers_carousel.dart';

class OffersCarouselAndCategories extends StatelessWidget {
  const OffersCarouselAndCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // While loading use 👇
        // const OffersSkelton(),
        const SizedBox(height: defaultPadding),
        const OffersCarousel(),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "See All    >",
                style: TextStyle(
                    color: Colors.blueAccent, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        // While loading use 👇
        // const CategoriesSkelton(),
        // const Categories(),
      ],
    );
  }
}
