import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shop/components/product/secondary_product_card.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/route/screen_export.dart';
import 'package:shop/screens/order/views/components/order_summary_card.dart';
import 'package:shop/services/cart_api.dart';

import '../../../constants.dart';
import 'components/coupon_code.dart';
import 'empty_cart_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  dynamic cartDetails;
  @override
  void initState() {
    // TODO: implement initState
    getCartProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: demoPopularProducts.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Text(
                      "Review your order",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  // While loading use 👇
                  // const ReviewYourItemsSkelton(),
                  SliverPadding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                          padding:
                              const EdgeInsets.only(bottom: defaultPadding),
                          child: SecondaryProductCard(
                            image: demoPopularProducts[index].image,
                            brandName: demoPopularProducts[index].brandName,
                            title: demoPopularProducts[index].title,
                            price: demoPopularProducts[index].price,
                            priceAfetDiscount:
                                demoPopularProducts[index].priceAfetDiscount,
                            style: ElevatedButton.styleFrom(
                              maximumSize: const Size(double.infinity, 80),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        childCount: demoPopularProducts.length,
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: CouponCode(),
                  ),

                  const SliverPadding(
                    padding:
                        EdgeInsets.symmetric(vertical: defaultPadding * 1.5),
                    sliver: SliverToBoxAdapter(
                      child: OrderSummaryCard(
                        subTotal: 169.0,
                        discount: 10,
                        totalWithVat: 185,
                        vat: 5,
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    sliver: SliverToBoxAdapter(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, paymentMethodScreenRoute);
                        },
                        child: const Text("Continue"),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/Illustration/NoResultDarkTheme.png",
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                  const SizedBox(height: defaultPadding),
                  Text(
                    "Your cart is empty",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: defaultPadding),
                  const Text(
                    "Customer network effects freemium. Advisor android paradigm shift product management. Customer disruptive crowdsource",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
    );
  }

  //MARK: API METHODS
  getCartProduct() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? apiToken = await storage.read(key: 'api_token');
    try {
      await CartApi.cartView(context: context, apiToken: apiToken!)
          .then((dioResult) async {
        if (dioResult != null) {
          cartDetails = dioResult.data;
          setState(() {
            cartDetails['products'].map((e) {
              demoPopularProducts.add(ProductModel(
                  image:
                      'https://opencart.ctportfolio.in/image/cache/catalog/demo/apple_cinema_30-228x228.jpg',
                  brandName: e['name'],
                  title: e['name'],
                  priceAfetDiscount: e['price'],
                  dicountpercent: 20,
                  price: e['price']));
            }).toList();
          });

          setState(() {});
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
