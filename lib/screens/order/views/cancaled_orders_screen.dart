import 'package:flutter/material.dart';
import 'package:shop/components/order_process.dart';
import 'package:shop/components/order_status_card.dart';
import 'package:shop/components/product/secondary_product_card.dart';
import 'package:shop/models/product_model.dart';

import '../../../constants.dart';

class CancledOrdersScreen extends StatelessWidget {
  const CancledOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cancled"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: ListView.separated(
          itemCount: 2,
          // While loading use 👇
          // OrderStatusCardSkelton(),
          itemBuilder: (context, cancledIndex) => OrderStatusCard(
            orderId: "FDS6398220",
            placedOn: "Jun 10, 2021",
            isCancled: true,
            orderStatus: OrderProcessStatus.done,
            processingStatus: OrderProcessStatus.done,
            packedStatus: cancledIndex == 0
                ? OrderProcessStatus.error
                : OrderProcessStatus.done,
            shippedStatus: OrderProcessStatus.error,
            deliveredStatus: OrderProcessStatus.error,
            products: List.generate(
              2,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: defaultPadding),
                child: SecondaryProductCard(
                  image: demoPopularProducts[cancledIndex + index].image,
                  brandName:
                      demoPopularProducts[cancledIndex + index].brandName,
                  title: demoPopularProducts[cancledIndex + index].title,
                  price: demoPopularProducts[cancledIndex + index].price,
                  priceAfetDiscount: demoPopularProducts[cancledIndex + index]
                      .priceAfetDiscount,
                  style: ElevatedButton.styleFrom(
                    maximumSize: const Size(double.infinity, 80),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) =>
              const SizedBox(height: defaultPadding),
        ),
      ),
    );
  }
}
