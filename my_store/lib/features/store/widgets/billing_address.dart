import 'package:flutter/material.dart';
import 'package:my_store/global/widgets/section_heading.dart';
import 'package:my_store/utils/constants/sizes.dart';

class BillingAddress extends StatelessWidget {
  const BillingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text(
          'Sarah Hughes',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: MySizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: MySizes.spaceBtwItems,
            ),
            Text(
              '+447264397792',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: MySizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: Colors.grey,
              size: 16,
            ),
            const SizedBox(
              width: MySizes.spaceBtwItems,
            ),
            Expanded(
              child: Text(
                '52 Honslow Street, Honslow, HU2 4820, UK',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
