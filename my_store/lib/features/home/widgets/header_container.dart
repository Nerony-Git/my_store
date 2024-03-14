import 'package:flutter/material.dart';
import 'package:my_store/global/shapes/circle_shape.dart';
import 'package:my_store/global/widgets/curved_edge.dart';
import 'package:my_store/utils/constants/colors.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdge(
      child: Container(
        color: MyColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: CircleShape(
                  backgroundColor: MyColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: CircleShape(
                  backgroundColor: MyColors.textWhite.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
