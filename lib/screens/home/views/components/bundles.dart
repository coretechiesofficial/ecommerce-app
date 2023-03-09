import 'package:flutter/material.dart';
import 'package:shop/route/route_constants.dart';

import '/components/Banner/M/banner_m_with_counter.dart';
import '../../../../components/product/product_card.dart';
import '../../../../constants.dart';
import '../../../../models/product_model.dart';

class Bundles extends StatelessWidget {
  const Bundles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: Text(
                "Bundles",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Text(
              "See All >",
              style: TextStyle(
                  color: Colors.blueAccent, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        // While loading show 👇
        // const ProductsSkelton(),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // Find demoBundlesProduct on models/ProductModel.dart
            itemCount: demoBundlesProduct.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right:
                    index == demoBundlesProduct.length - 1 ? defaultPadding : 0,
              ),
              child: ProductCard(
                image: demoBundlesProduct[index].image,
                brandName: '',
                title: demoBundlesProduct[index].title,
                price: demoBundlesProduct[index].price,
                // priceAfetDiscount:
                //     demoBundlesProduct[index].priceAfetDiscount,
                // dicountpercent: demoBundlesProduct[index].dicountpercent,
                press: () {
                  Navigator.pushNamed(context, productDetailsScreenRoute,
                      arguments: index.isEven);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
