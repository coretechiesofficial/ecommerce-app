import 'package:flutter/material.dart';

import '../../constants.dart';
import '../components/network_image_with_loader.dart';

class CardProductModel {
  final String image, title;
  final VoidCallback? press;
  final ButtonStyle? style;

  CardProductModel({
    required this.image,
    required this.title,
    this.press,
    this.style,
  });
}

class CardProduct extends StatelessWidget {
  CardProduct({
    Key? key,
  }) : super(key: key);

  List<CardProductModel> homeDemoCategories = [
    CardProductModel(
      title: "Playing Sets For Kids",
      image: "https://www.lunapic.com/editor/premade/transparent.gif",
    ),
    CardProductModel(
      title: "Dolls & Collectables",
      image:
          "https://cdn.pixabay.com/photo/2020/03/03/18/03/bear-4899421_960_720.png",
    ),
    CardProductModel(
      title: "Fashion & Cosmatics",
      image: "https://www.lunapic.com/editor/premade/transparent.gif",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            homeDemoCategories.length,
            (index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                      Container(
                        height: 90,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: Center(
                      child: Text(
                        homeDemoCategories[index].title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 12),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    child: Image.network(
                      homeDemoCategories[index].image,
                      height: 120,
                      width: 120,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
