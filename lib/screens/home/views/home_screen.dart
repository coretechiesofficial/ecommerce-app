import 'package:flutter/material.dart';
import 'package:shop/components/Banner/L/banner_l_style_1.dart';
import 'package:shop/components/Banner/M/banner_m.dart';
import 'package:shop/components/Banner/S/banner_s_style_1.dart';
import 'package:shop/components/Banner/S/banner_s_style_4.dart';
import 'package:shop/components/Banner/S/banner_s_style_5.dart';
import 'package:shop/constants.dart';
import 'package:shop/route/screen_export.dart';
import 'package:shop/screens/home/views/components/bundles.dart';
import 'package:shop/screens/home/views/components/featured_toys.dart';

import '../../../models/card_product_model.dart';
import '../../../models/product_model.dart';
import '../../../services/home_api.dart';
import '../../../utils/commons.dart';
import 'components/best_sellers.dart';
import 'components/flash_sale.dart';
import 'components/homecategories.dart';
import 'components/most_popular.dart';
import 'components/offer_carousel_and_categories.dart';
import 'components/popular_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel>? popularProducts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getPopularProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: HomeCategories()),
            const SliverToBoxAdapter(child: OffersCarouselAndCategories()),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverToBoxAdapter(
                  child: CardProduct(

                      // popularProducts: popularProducts != null ? popularProducts! : [],
                      // demoPopularProducts: demoPopularProducts,
                      )),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(
                  vertical: defaultPadding * 1.5, horizontal: 10),
              sliver: SliverToBoxAdapter(child: PecoWare()),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverToBoxAdapter(child: Bundles()),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(
                  vertical: defaultPadding * 1.5, horizontal: 10),
              sliver: SliverToBoxAdapter(child: PecoWare()),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverToBoxAdapter(child: Bundles()),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverToBoxAdapter(child: Bundles()),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(
                  vertical: defaultPadding * 1.5, horizontal: 10),
              sliver: SliverToBoxAdapter(child: PecoWare()),
            ),
            SliverToBoxAdapter(child: FeaturedToys()),
            /*SliverToBoxAdapter(
              child: Column(
                children: [
                  // While loading use 👇
                  // const BannerMSkelton(),‚
                  BannerSStyle1(
                    title: "New \narrival",
                    subtitle: "SPECIAL OFFER",
                    discountParcent: 50,
                    press: () {
                      Navigator.pushNamed(context, onSaleScreenRoute);
                    },
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  // While loading use 👇
                  //  const BannerMSkelton(),
                  BannerSStyle4(
                    title: "SUMMER \nSALE",
                    subtitle: "SPECIAL OFFER",
                    bottomText: "UP TO 80% OFF",
                    press: () {
                      Navigator.pushNamed(context, onSaleScreenRoute);
                    },
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  // While loading use 👇
                  //  const BannerMSkelton(),
                  BannerSStyle4(
                    image: "https://i.imgur.com/dBrsD0M.png",
                    title: "Black \nfriday",
                    subtitle: "50% off",
                    bottomText: "Collection".toUpperCase(),
                    press: () {
                      Navigator.pushNamed(context, onSaleScreenRoute);
                    },
                  ),
                ],
              ),
            ),*/
            // const SliverToBoxAdapter(child: BestSellers()),
            // const SliverToBoxAdapter(child: MostPopular()),
            /*SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: defaultPadding * 1.5),
                  // While loading use 👇
                  // const BannerLSkelton(),
                  BannerLStyle1(
                    title: "Summer \nSale",
                    subtitle: "SPECIAL OFFER",
                    discountPercent: 50,
                    press: () {
                      Navigator.pushNamed(context, onSaleScreenRoute);
                    },
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  // While loading use 👇
                  // const BannerSSkelton(),
                  BannerSStyle5(
                    title: "Black \nfriday",
                    subtitle: "50% Off",
                    bottomText: "Collection".toUpperCase(),
                    press: () {
                      Navigator.pushNamed(context, onSaleScreenRoute);
                    },
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  // While loading use 👇
                  // const BannerSSkelton(),
                  BannerSStyle5(
                    image: "https://i.imgur.com/2443sJb.png",
                    title: "Grab \nyours now",
                    subtitle: "65% Off",
                    press: () {
                      Navigator.pushNamed(context, onSaleScreenRoute);
                    },
                  ),
                ],
              ),
            ),*/
            // const SliverToBoxAdapter(child: BestSellers()),
          ],
        ),
      ),
    );
  }

  //Mark:-Api Methods
  //MARK: -Class Methods
  getPopularProduct() async {
    try {
      await HomeApi.product(context: context).then((dioResult) async {
        if (dioResult != null) {
          List popularProducts1 = dioResult.data;
          setState(() {
            popularProducts1.map((e) {
              popularProducts!.add(ProductModel(
                  image: e['thumb'],
                  brandName: e['name'],
                  title: e['description'],
                  priceAfetDiscount:
                      e['special'] == false ? e['price'] : e['special'],
                  dicountpercent: 20,
                  price: e['price']));

              demoFlashSaleProducts.add(ProductModel(
                  image: e['thumb'],
                  brandName: e['name'],
                  title: e['description'],
                  priceAfetDiscount:
                      e['special'] == false ? e['price'] : e['special'],
                  dicountpercent: 20,
                  price: e['price']));
              demoBestSellersProducts.add(ProductModel(
                  image: e['thumb'],
                  brandName: e['name'],
                  title: e['description'],
                  priceAfetDiscount:
                      e['special'] == false ? e['price'] : e['special'],
                  dicountpercent: 20,
                  price: e['price']));
              kidsProducts.add(ProductModel(
                  image: e['thumb'],
                  brandName: e['name'],
                  title: e['description'],
                  priceAfetDiscount:
                      e['special'] == false ? e['price'] : e['special'],
                  dicountpercent: 20,
                  price: e['price']));
            }).toList();
          });
          // _isLoading = true;
          setState(() {
            demoFlashSaleProducts;
            demoBestSellersProducts;
            kidsProducts;
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
