import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/navigation/widgets/navigation_menu.dart';
import 'package:my_store/features/store/widgets/billing_address.dart';
import 'package:my_store/features/store/widgets/billing_amount.dart';
import 'package:my_store/features/store/widgets/billing_payment.dart';
import 'package:my_store/features/store/widgets/cart_items.dart';
import 'package:my_store/features/store/widgets/coupon_code.dart';
import 'package:my_store/global/screens/success.dart';
import 'package:my_store/global/widgets/containers/rounded_container.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Review Order',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              /// Cart Items
              const CartItems(
                showAddRemoveButtons: false,
              ),
              const SizedBox(
                height: MySizes.spaceBtwSections,
              ),

              /// Coupons
              CouponCode(),
              const SizedBox(
                height: MySizes.spaceBtwSections,
              ),

              /// Billing section
              RoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(MySizes.md),
                backgroundColor: dark ? MyColors.black : MyColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    BillingAmount(),

                    /// Divider
                    Divider(),
                    SizedBox(
                      height: MySizes.spaceBtwItems / 2,
                    ),

                    /// Payment methods
                    BillingPayment(),
                    SizedBox(
                      height: MySizes.spaceBtwItems,
                    ),

                    /// Divider
                    Divider(),
                    SizedBox(
                      height: MySizes.spaceBtwItems / 2,
                    ),

                    /// Address
                    BillingAddress(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// Checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              img: MyImages.successfulPaymentIcon,
              title: 'Payment Successful!',
              subTitle: 'Your order has been place and will be shipped soon!',
              onPressed: () => Get.offAll(() => const NavigationMenu()),
            ),
          ),
          child: const Text('Checkout £ 692.00'),
        ),
      ),
    );
  }
}
