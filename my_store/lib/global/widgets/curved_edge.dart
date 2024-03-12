import 'package:flutter/material.dart';
import 'package:my_store/global/edges/curved_edges.dart';

class CurvedEdge extends StatelessWidget {
  const CurvedEdge({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedEdges(),
      child: child,
    );
  }
}
