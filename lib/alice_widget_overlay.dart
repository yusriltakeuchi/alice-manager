import 'package:flutter/material.dart';

class AliceWidgetOverlay extends StatelessWidget {
  final Widget child;

  const AliceWidgetOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(builder: (context) => child),
      ],
    );
  }
}
