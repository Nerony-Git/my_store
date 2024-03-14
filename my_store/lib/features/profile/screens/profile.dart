import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/profile/widgets/profile_menu.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/global/widgets/imgs/round_image.dart';
import 'package:my_store/global/widgets/section_heading.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              /// Profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const RoundImage(img: MyImages.user, width: 80, height: 80,),
                    TextButton(onPressed: () {}, child: const Text('Change Profile Picture'),),
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: MySizes.spaceBtwItems / 2,),
              const Divider(),
              const SizedBox(height: MySizes.spaceBtwItems,),
              const SectionHeading(title: 'Profile Information', showActionButton: false,),
              const SizedBox(height: MySizes.spaceBtwItems,),

              ProfileMenu(onPressed: (){}, title: 'Name', value: 'Nerony Tech',),
              ProfileMenu(onPressed: (){}, title: 'Username', value: 'nerony',),

              const SizedBox(height: MySizes.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: MySizes.spaceBtwItems,),
              const SectionHeading(title: 'Personal Information', showActionButton: false,),
              const SizedBox(height: MySizes.spaceBtwItems,),

              ProfileMenu(onPressed: (){}, title: 'User ID', value: '382739', icon: Iconsax.copy,),
              ProfileMenu(onPressed: (){}, title: 'E-mail', value: 'neronytech@gmail.com',),
              ProfileMenu(onPressed: (){}, title: 'Phone Number', value: '03772849927',),
              ProfileMenu(onPressed: (){}, title: 'Gender', value: 'Male',),
              ProfileMenu(onPressed: (){}, title: 'Date of Birth', value: '21 Sep, 2005',),

              const Divider(),
              const SizedBox(height: MySizes.spaceBtwItems,),

              Center(
                child: TextButton(onPressed: () {}, child: const Text('Close Account', style: TextStyle(color: Colors.red),),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}