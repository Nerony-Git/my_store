import 'package:flutter/material.dart';
import 'package:my_store/features/order/widgets/order_list.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(MySizes.defaultSpace),

        /// Orders
        child: OrderList(),
      ),
    );
  }
}
