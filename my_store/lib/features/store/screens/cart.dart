import 'package:flutter/material.dart';
import 'package:my_store/features/store/widgets/cart_item_card.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/global/widgets/product/add_remove_qty_button.dart';
import 'package:my_store/global/widgets/product/product_price.dart';
import 'package:my_store/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: Text('Cart',style: Theme.of(context).textTheme.headlineSmall,),),
      body: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpace),
        child: ListView.separated(
          itemBuilder: (_, index) => const Column(
            children: [
              CartItemCard(),
              SizedBox(height: MySizes.spaceBtwItems,),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Add and remove buttons
                  Row(
                    children: [
                    SizedBox(width: 70,),
                      AddRemoveQtyButton(),
                    ],
                  ),
      
                  /// Total price
                  ProductPrice(price: '280'),
                ],
              ),
            ],
          ), 
          separatorBuilder: (_, __) => const SizedBox(height: MySizes.spaceBtwSections,), 
          itemCount: 8,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpace),
        child: ElevatedButton(onPressed: () {}, child: Text('Checkout £ 280.00'),),
      ),
    );
  }
}
