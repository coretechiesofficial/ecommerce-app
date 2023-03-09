import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/route/screen_export.dart';

import '../../../../constants.dart';

// For preview
class HomeCategoryModel {
  final String name;
  final String? svgSrc, route;

  HomeCategoryModel({
    required this.name,
    this.svgSrc,
    this.route,
  });
}

List<HomeCategoryModel> demoCategories = [
  HomeCategoryModel(
      name: "Girls ",
      svgSrc:
          "https://media.gettyimages.com/id/859874128/photo/hugging-teddy.jpg?s=612x612&w=gi&k=20&c=Iitt-ITuisWRyG5ZGT2JOqodcwtlRSPONuKRPBP06jg=",
      route: onSaleScreenRoute),
  HomeCategoryModel(
      name: "Boys",
      svgSrc:
          "https://media.gettyimages.com/id/637266678/photo/playful-boy-between-plastic-blocks.jpg?s=612x612&w=0&k=20&c=RiZzdplshDa5LikjNRJLx_NxcOvQCqX1XoS4LDeWmgs="),
];
// End For Preview

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            demoCategories.length,
            (index) => HomeCategoryBtn(
              category: demoCategories[index].name,
              svgSrc: demoCategories[index].svgSrc,
              isActive: index == 0,
              press: () {
                if (demoCategories[index].route != null) {
                  Navigator.pushNamed(context, demoCategories[index].route!);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCategoryBtn extends StatelessWidget {
  const HomeCategoryBtn({
    Key? key,
    required this.category,
    this.svgSrc,
    required this.isActive,
    required this.press,
  }) : super(key: key);

  final String category;
  final String? svgSrc;
  final bool isActive;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                svgSrc!,
                fit: BoxFit.fill,
                height: 90,
                width: 170,
              ),
            ),
            Positioned(
              top: 25,
              left: 5,
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
