import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/product/controllers/variation_controller.dart';
import 'package:my_store/global/widgets/chips/choice_chip.dart';
import 'package:my_store/global/widgets/containers/rounded_container.dart';
import 'package:my_store/global/widgets/product/product_price.dart';
import 'package:my_store/global/widgets/product/product_title.dart';
import 'package:my_store/global/widgets/section_heading.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';
import 'package:my_store/utils/models/product_model.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = HelperFunctions.isDarkMode(context);

    return Obx(
      () => Column(
        children: [
          /// Selected attribute pricing and description
          // Display variation price and stock when some variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
            RoundedContainer(
              padding: const EdgeInsets.all(MySizes.md),
              backgroundColor: dark ? MyColors.darkerGrey : MyColors.grey,
              child: Column(
                children: [
                  /// Title, price and stock status
                  Row(
                    children: [
                      const SectionHeading(
                        title: 'Variation',
                        showActionButton: false,
                      ),
                      const SizedBox(
                        width: MySizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              /// Title
                              const ProductTitle(
                                title: 'Price: ',
                                smallSize: true,
                              ),

                              /// Actual price
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '£${controller.selectedVariation.value.price}  ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),

                              /// Sale price
                              ProductPrice(
                                  price: controller.getVariationPrice()),
                            ],
                          ),

                          /// Stock
                          Row(
                            children: [
                              const ProductTitle(
                                title: 'Stock: ',
                                smallSize: true,
                              ),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// Variation description
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ProductTitle(
                        title: controller.selectedVariation.value.description ??
                            '',
                        smallSize: true,
                        maxLines: 4,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          const SizedBox(
            height: MySizes.spaceBtwItems,
          ),

          /// Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeading(
                        title: attribute.name ?? '',
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: MySizes.spaceBtwItems / 2,
                      ),
                      Obx(
                        () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue) {
                            final isSelected =
                                controller.selectedAttributes[attribute.name] ==
                                    attributeValue;
                            final available = controller
                                .getAttributesAvailabilityInVariation(
                                    product.productVariations!, attribute.name!)
                                .contains(attributeValue);

                            return CustomChoiceChip(
                              text: attributeValue,
                              selected: isSelected,
                              onSelected: available
                                  ? (selected) {
                                      if (selected && available) {
                                        controller.onAttributeSelected(
                                            product,
                                            attribute.name ?? '',
                                            attributeValue);
                                      }
                                    }
                                  : null,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
