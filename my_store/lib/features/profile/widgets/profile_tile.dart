import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/global/widgets/imgs/round_image.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/images.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const RoundImage(img: MyImages.user, width: 50, height: 50, padding: 0,),
      title: Text('Nerony Tech', style: Theme.of(context).textTheme.headlineSmall!.apply(color: MyColors.white),),
      subtitle: Text('neronytech@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: MyColors.white),),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: MyColors.white,)),
    );
  }
}
