import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/texts.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class TNCs extends StatelessWidget {
  const TNCs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        ),
        const SizedBox(width: MySizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${MyText.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: '${MyText.privacyPolicy} ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? MyColors.white : MyColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? MyColors.white : MyColors.primary,
                      )),
              TextSpan(
                  text: '${MyText.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: '${MyText.termsOfUse}.',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? MyColors.white : MyColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? MyColors.white : MyColors.primary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
