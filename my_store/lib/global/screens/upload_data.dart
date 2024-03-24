import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/global/widgets/data/dummy_data.dart';
import 'package:my_store/global/widgets/data/upload_data_tile.dart';
import 'package:my_store/global/widgets/section_heading.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/controllers/upload_data_controller.dart';
import 'package:my_store/utils/models/banner_model.dart';
import 'package:my_store/utils/models/product_model.dart';

class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadDataController());
    List<BannerModel> banners = DummyData.banners;
    List<ProductModel> products = DummyData.products;

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Upload Data'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              /// Main record
              const SectionHeading(
                title: 'Main Record',
                showActionButton: false,
              ),
              const SizedBox(
                height: MySizes.spaceBtwItems,
              ),

              UploadDataTile(
                icon: Iconsax.category,
                title: 'Upload Categories',
                onTap: () {},
              ),
              const SizedBox(
                height: MySizes.spaceBtwItems,
              ),

              UploadDataTile(
                icon: Iconsax.shop,
                title: 'Upload Brands',
                onTap: () {},
              ),
              const SizedBox(
                height: MySizes.spaceBtwItems,
              ),

              UploadDataTile(
                icon: Iconsax.shopping_cart,
                title: 'Upload Products',
                onTap: () => controller.uploadProducts(products),
              ),
              const SizedBox(
                height: MySizes.spaceBtwItems,
              ),

              UploadDataTile(
                icon: Iconsax.image,
                title: 'Upload Banners',
                onTap: () => controller.uploadBanners(banners),
              ),
              const SizedBox(
                height: MySizes.spaceBtwSections * 2,
              ),

              /// Relationships
              const SectionHeading(
                title: 'Relationships',
                showActionButton: false,
              ),
              const SizedBox(
                height: MySizes.spaceBtwItems,
              ),

              UploadDataTile(
                icon: Iconsax.link,
                title: 'Upload Brands & Categories Relation Data',
                onTap: () {},
              ),
              const SizedBox(
                height: MySizes.spaceBtwItems,
              ),

              UploadDataTile(
                icon: Iconsax.link,
                title: 'Upload Product Categories Relational Data',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
