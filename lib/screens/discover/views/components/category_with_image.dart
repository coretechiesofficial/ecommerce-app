import 'package:flutter/material.dart';
import 'package:shop/components/network_image_with_loader.dart';

import '../../../../constants.dart';

class CategoryWithImage extends StatelessWidget {
  const CategoryWithImage({
    Key? key,
    this.image = "https://i.imgur.com/5M89G2P.png",
    required this.title,
    required this.press,
  }) : super(key: key);

  final String image, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.56,
      child: GestureDetector(
        onTap: press,
        child: Stack(
          alignment: Alignment.center,
          children: [
            NetworkImageWithLoader(image, radius: 0),
            Container(color: Colors.black45),
            Text(
              title,
              style: const TextStyle(
                fontFamily: grandisExtendedFont,
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
