import 'package:alice_manager/alice_manager.dart';
import 'package:draggable_float_widget/draggable_float_widget.dart';
import 'package:flutter/material.dart';

class OverlayAlice {
  static OverlayEntry? overlayEntry;

  static bool isShow = false;

  static void insertOverlay(
    BuildContext context,
  ) {
    close();
    overlayEntry = OverlayEntry(
      builder: (context) {
        return DraggableFloatWidget(
          height: 40,
          width: 40,
          config: const DraggableFloatWidgetBaseConfig(
            initPositionYInTop: false,
            borderTopContainTopBar: true,
            appBarHeight: 0,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                AliceManager.instance.showInspector();
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    return Overlay.of(context).insert(overlayEntry!);
  }

  static close() {
    if (OverlayAlice.overlayEntry == null) {
      return;
    }
    overlayEntry!.remove();
    OverlayAlice.overlayEntry = null;
  }

  static showLive() {}
}
