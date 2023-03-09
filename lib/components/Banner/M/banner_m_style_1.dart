import 'package:flutter/material.dart';
import 'banner_m.dart';

import '../../../constants.dart';

class BannerMStyle1 extends StatelessWidget {
  const BannerMStyle1({
    Key? key,
    this.image = "https://media.gettyimages.com/id/1237483283/photo/barbie-dolls-are-seen-at-the-toy-shop-in-krakow-poland-on-december-30-2021.jpg?s=612x612&w=0&k=20&c=BDuX_rJQL45fPOjhd9BJcQ0Fh-688htaUe46iknd2Vg=",
    required this.text,
    required this.press,
  }) : super(key: key);
  final String? image;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BannerM(
      image: image!,
      press: press,
      children: [
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontFamily: grandisExtendedFont,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                "Shop now",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 64,
                child: Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ],
    );
  }
}
