import 'package:flutter/material.dart';
import 'package:my_store/features/order/widgets/order_card.dart';
import 'package:my_store/utils/constants/sizes.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, index) => OrderCard(),
      separatorBuilder: (_, __) => const SizedBox(
        height: MySizes.spaceBtwItems,
      ),
      itemCount: 6,
    );
  }
}
